using System.Globalization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.AspNetCore.Mvc.Versioning;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace Melad.Common.WebFramework;

public static class CustomApiVersioning
{
    public static IServiceCollection AddCustomApiVersioning(this IServiceCollection services)
    {
        services.AddApiVersioning(options =>
        {
            //url segment => {version}
            options.AssumeDefaultVersionWhenUnspecified = true; //default => false;
            options.DefaultApiVersion = new ApiVersion(1, 0); //v1.0 == v1
            options.ReportApiVersions = true;

            //ApiVersion.TryParse("1.0", out var version10);
            //ApiVersion.TryParse("1", out var version1);
            //var a = version10 == version1;

            //options.ApiVersionReader = new QueryStringApiVersionReader("api-version");
            // api/posts?api-version=1

            //options.ApiVersionReader = new UrlSegmentApiVersionReader();
            // api/v1/posts
            options.ApiVersionReader = new UrlSegmentApiVersionReader();
            // header => Api-Version : 1
            //options.ApiVersionReader = new MediaTypeApiVersionReader()
            //options.ApiVersionReader = ApiVersionReader.Combine(new QueryStringApiVersionReader("api-version"), new UrlSegmentApiVersionReader())
            // combine of [querystring] & [urlsegment]
        });
        return services;
    }

    public static IServiceCollection AddMinimalMvc(this IServiceCollection services)
    {
        //https://github.com/aspnet/AspNetCore/blob/0303c9e90b5b48b309a78c2ec9911db1812e6bf3/src/Mvc/Mvc/src/MvcServiceCollectionExtensions.cs
        services.AddControllers(options =>
        {
            options.Filters.Add(new AuthorizeFilter()); //Apply AuthorizeFilter as global filter to all actions
            options.SuppressAsyncSuffixInActionNames = false;
            //Like [ValidateAntiforgeryToken] attribute but dose not validatie for GET and HEAD http method
            //You can ingore validate by using [IgnoreAntiforgeryToken] attribute
            //Use this filter when use cookie 
            //options.Filters.Add(new AutoValidateAntiforgeryTokenAttribute());

            //options.UseYeKeModelBinder();
        }).AddNewtonsoftJson(option =>
        {
            option.SerializerSettings.Converters.Add(new StringEnumConverter());
            option.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
            //option.SerializerSettings.Formatting = Newtonsoft.Json.Formatting.Indented;
            //option.SerializerSettings.NullValueHandling = Newtonsoft.Json.NullValueHandling.Ignore;
        });
        services.AddSwaggerGenNewtonsoftSupport();

        #region Old way (We don't need this from ASP.NET Core 3.0 onwards)

        ////https://github.com/aspnet/Mvc/blob/release/2.2/src/Microsoft.AspNetCore.Mvc/MvcServiceCollectionExtensions.cs
        //services.AddMvcCore(options =>
        //{
        //    options.Filters.Add(new AuthorizeFilter());

        //    //Like [ValidateAntiforgeryToken] attribute but dose not validatie for GET and HEAD http method
        //    //You can ingore validate by using [IgnoreAntiforgeryToken] attribute
        //    //Use this filter when use cookie 
        //    //options.Filters.Add(new AutoValidateAntiforgeryTokenAttribute());

        //    //options.UseYeKeModelBinder();
        //})
        //.AddApiExplorer()
        //.AddAuthorization()
        //.AddFormatterMappings()
        //.AddDataAnnotations()
        //.AddJsonOptions(option =>
        //{
        //    //option.JsonSerializerOptions
        //})
        //.AddNewtonsoftJson(/*option =>
        //{
        //    option.SerializerSettings.Formatting = Newtonsoft.Json.Formatting.Indented;
        //    option.SerializerSettings.NullValueHandling = Newtonsoft.Json.NullValueHandling.Ignore;
        //}*/)

        ////Microsoft.AspNetCore.Mvc.Formatters.Json
        ////.AddJsonFormatters(/*options =>
        ////{
        ////    options.Formatting = Newtonsoft.Json.Formatting.Indented;
        ////    options.NullValueHandling = Newtonsoft.Json.NullValueHandling.Ignore;
        ////}*/)

        //.AddCors()
        //.SetCompatibilityVersion(CompatibilityVersion.Latest); //.SetCompatibilityVersion(CompatibilityVersion.Version_2_1)

        #endregion

        return services;
    }
}
