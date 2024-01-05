using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Melad.Common.WebFramework.MiniProfiler;

public static class InstallMiniProfiler
{
    public static IServiceCollection AddMiniProfiler(this IServiceCollection services)
    {
        services.AddMiniProfiler(options =>
        {
            options.RouteBasePath = "/profiler";
        });
        return services;
    }
}
