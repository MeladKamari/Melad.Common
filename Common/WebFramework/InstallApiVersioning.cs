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

public static class InstallApiVersioning
{
    public static IServiceCollection AddCustomApiVersioning(this IServiceCollection services)
    {
        services.AddApiVersioning(options =>
        {
            options.AssumeDefaultVersionWhenUnspecified = true;
            options.DefaultApiVersion = new ApiVersion(1, 0); 
            options.ReportApiVersions = true;
            options.ApiVersionReader = new UrlSegmentApiVersionReader();
        });
        return services;
    }

    public static IServiceCollection AddMinimalMvc(this IServiceCollection services)
    {
        services.AddControllers(options =>
        {
            options.Filters.Add(new AuthorizeFilter()); 
            options.SuppressAsyncSuffixInActionNames = false;
        }).AddNewtonsoftJson(option =>
        {
            option.SerializerSettings.Converters.Add(new StringEnumConverter());
            option.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
        });
        services.AddSwaggerGenNewtonsoftSupport();
        return services;
    }
}
