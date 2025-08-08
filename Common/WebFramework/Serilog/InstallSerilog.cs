using System.Reflection;
using Microsoft.Extensions.Hosting;
using Serilog;
using Serilog.Events;
using Serilog.Sinks.Elasticsearch;
using Serilog.Sinks.SystemConsole.Themes;

namespace Melad.Common.WebFramework.Serilog;

public static class InstallSerilog
{
    /// <summary>
    /// Add Serilog Console And Elastic
    /// </summary>
    /// <param name="hostBuilder"></param>
    /// <param name="elasticUri"></param>
    /// <param name="userName"></param>
    /// <param name="password"></param>
    /// <returns></returns>
    public static IHostBuilder AddSerilog(this IHostBuilder hostBuilder,  string? elasticUri,
        string? userName, string? password)
    {
        hostBuilder.UseSerilog((context, configuration) =>
        {
            var environment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
            configuration.MinimumLevel.Override("Microsoft", LogEventLevel.Error)
                .MinimumLevel.Override("Microsoft.AspNetCore", LogEventLevel.Error)
                .Enrich.FromLogContext()
                .Enrich.WithProperty("Environment", environment)
                .WriteTo.Elasticsearch(new ElasticsearchSinkOptions(new Uri($"{elasticUri}"))
                {
                    IndexFormat = $"{Assembly.GetExecutingAssembly().GetName().Name!.ToLower().Replace(".", "-")}" +
                                  $"-{environment?.ToLower().Replace(".", "-")}-{TimeProvider.System.GetUtcNow():yyyy-MM}",
                    ModifyConnectionSettings = x =>
                        x.BasicAuthentication(userName, password),
                    FailureCallback = (l,e) => Console.WriteLine("Unable submit event to ElasticSearch" + e.InnerException),
                    EmitEventFailure = EmitEventFailureHandling.WriteToSelfLog |
                                       EmitEventFailureHandling.WriteToFailureSink |
                                       EmitEventFailureHandling.RaiseCallback,
                    AutoRegisterTemplate = true,
                })
                .ReadFrom.Configuration(context.Configuration)
                .WriteTo.Console(theme: SystemConsoleTheme.Colored, applyThemeToRedirectedOutput: true);
        });
        return hostBuilder;
    }
}
