using Melad.Common.Infra.SqlServer.Context;
using Melad.Common.Infra.SqlServer.GenericRepository;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Melad.Common.WebFramework.SqlServer;

public static class InstallSqlServer
{
    public static IServiceCollection AddSqlServerDatabase<T>(this IServiceCollection services,
        IConfiguration configuration) where T:DbContext
    {
        services.AddDbContext<T>(opt =>
        {
#if DEBUG
            var res = typeof(T).Assembly.FullName;
            opt.LogTo(Console.WriteLine,
                new[] { DbLoggerCategory.Database.Command.Name },
                LogLevel.Debug,
                DbContextLoggerOptions.SingleLine | DbContextLoggerOptions.UtcTime);
#endif
            opt.UseSqlServer(configuration.GetConnectionString("ApplicationConnection"));
        });
        return services;
    }
}
