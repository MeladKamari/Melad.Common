using System.Reflection;
using Melad.Common.Infra.SqlServer.GenericRepository;
using Melad.Common.WebFramework.LifetimeInterfaces;
using Microsoft.Extensions.DependencyInjection;

namespace Melad.Common.WebFramework.Scrutor;

public static class InstallScrutor
{
    public static IServiceCollection AddScrutor(this IServiceCollection service, params Assembly[] assembly)
    {
        service.Scan(selector => selector
            .FromAssemblies(assembly)
            .AddClasses(classes => { classes.AssignableTo<IScopedDependency>(); })
            .AsImplementedInterfaces()
            .WithScopedLifetime()
            .AddClasses(classes => { classes.AssignableTo<ITransientDependency>(); })
            .AsImplementedInterfaces()
            .WithTransientLifetime()
            .AddClasses(classes => { classes.AssignableTo<ISingletonDependency>(); })
            .AsImplementedInterfaces()
            .WithSingletonLifetime());
        return service;
    }
}
