using System.Net;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace Melad.Common.WebFramework;

public static class CustomExceptionHandlerMiddlewareExtensions
{
    public static IApplicationBuilder UseCustomExceptionHandler(this IApplicationBuilder builder)
    {
        return builder.UseMiddleware<CustomExceptionHandlerMiddleware>();
    }
}

public class CustomExceptionHandlerMiddleware
{
    private readonly IHostEnvironment _env;
    private readonly ILogger<CustomExceptionHandlerMiddleware> _logger;
    private readonly RequestDelegate _next;

    public CustomExceptionHandlerMiddleware(RequestDelegate next,
        IHostEnvironment env,
        ILogger<CustomExceptionHandlerMiddleware> logger)
    {
        _next = next;
        _env = env;
        _logger = logger;
    }

    public async Task Invoke(HttpContext context)
    {
        string message = null!;
        var httpStatusCode = HttpStatusCode.InternalServerError;
        var apiStatusCode = ApiResultStatusCode.ServerError;
        try
        {
            await _next(context);
        }
        catch (AppException exception)
        {
            _logger.LogError(exception, exception.Message);
            httpStatusCode = exception.HttpStatusCode;
            apiStatusCode = exception.ApiStatusCode;
#if DEBUG

            var dic = new Dictionary<string, string>
            {
                ["Exception"] = exception.Message,
                ["StackTrace"] = exception.StackTrace!
            };
            if (exception.InnerException != null)
            {
                dic.Add("InnerException.Exception", exception.InnerException.Message);
                dic.Add("InnerException.StackTrace", exception.InnerException.StackTrace!);
            }

            if (exception.AdditionalData != null)
                dic.Add("AdditionalData", JsonConvert.SerializeObject(exception.AdditionalData));

            message = JsonConvert.SerializeObject(dic);
#endif

# if !DEBUG
                message = exception.Message;
#endif
            await WriteToResponseAsync();
        }
        catch (SecurityTokenExpiredException exception)
        {
            _logger.LogError(exception, exception.Message);
            SetUnAuthorizeResponse(exception);
            await WriteToResponseAsync();
        }
        catch (UnauthorizedAccessException exception)
        {
            _logger.LogError(exception, exception.Message);
            SetUnAuthorizeResponse(exception);
            await WriteToResponseAsync();
        }
        catch (Exception exception)
        {
            IAppException domainException = (exception as IAppException)!;
            if (domainException != null)
            {
                httpStatusCode = (HttpStatusCode)domainException.StatusCode;
                message = exception.Message;
                apiStatusCode = (ApiResultStatusCode)domainException.StatusCode;
            }

            _logger.LogError(exception, exception.Message);
#if DEBUG

            var dic = new Dictionary<string, string>
            {
                ["Exception"] = $"{message} {exception.Message}",
                ["StackTrace"] = exception.StackTrace!
            };
            message = JsonConvert.SerializeObject(dic);
#endif
            await WriteToResponseAsync();
        }

        async Task WriteToResponseAsync()
        {
            if (context.Response.HasStarted)
                throw new InvalidOperationException(
                    "The response has already started, the http status code middleware will not be executed.");

            var result = new ApiResult(false, apiStatusCode, message);
            var json = JsonConvert.SerializeObject(result, new JsonSerializerSettings
            {
                ContractResolver = new CamelCasePropertyNamesContractResolver()
            });

            context.Response.StatusCode = (int)httpStatusCode;
            context.Response.ContentType = "application/json";
            await context.Response.WriteAsync(json);
        }

        void SetUnAuthorizeResponse(Exception exception)
        {
            httpStatusCode = HttpStatusCode.Unauthorized;
            apiStatusCode = ApiResultStatusCode.UnAuthorized;

            if (_env.IsDevelopment())
            {
                var dic = new Dictionary<string, string>
                {
                    ["Exception"] = exception.Message,
                    ["StackTrace"] = exception.StackTrace!
                };
                if (exception is SecurityTokenExpiredException tokenException)
                    dic.Add("Expires", tokenException.Expires.ToString());

                message = JsonConvert.SerializeObject(dic);
            }
        }
    }
}