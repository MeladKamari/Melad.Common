using System.Reflection;
using Melad.Common.Extensions;
using Melad.Common.Infra.Domains;
using Melad.Common.Infra.SqlServer.GenericRepository;
using Melad.Common.WebFramework.LifetimeInterfaces;

namespace Melad.Common.Infra.SqlServer.Context;

public class DbContextCore: DbContext
{
    public const string Version = nameof(Version);

    public DbContextCore()
    {
            
    }
    public DbContextCore(DbContextOptions options) : base(options) { }

    protected override void ConfigureConventions(ModelConfigurationBuilder configurationBuilder)
    {
        configurationBuilder.Properties<string>()
            .HaveMaxLength(200);
        base.ConfigureConventions(configurationBuilder);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        var types = modelBuilder.Model.GetEntityTypes().ToList();

        foreach (var entityType in types.Where(e => typeof(IHasRowVersion).IsAssignableFrom(e.ClrType)))
        {
            modelBuilder.Entity(entityType.ClrType)
                .Property<byte[]>(Version)
                .IsRowVersion();
        }
        modelBuilder.UseIdentityColumns();
        var entitiesAssembly = AppDomain.CurrentDomain.GetAssemblies().
          SingleOrDefault(assembly => assembly.GetName().Name == "Domain");
        modelBuilder.RegisterAllEntities<IBaseEntity>(entitiesAssembly!);
        var infraAssembly = AppDomain.CurrentDomain.GetAssemblies().
            SingleOrDefault(assembly => assembly.GetName().Name == "Infrastructure");
        modelBuilder.ApplyConfigurationsFromAssembly(infraAssembly!);
        modelBuilder.AddRestrictDeleteBehaviorConvention();
        modelBuilder.AddSequentialGuidForIdConvention();
        base.OnModelCreating(modelBuilder);
    }

    public override int SaveChanges()
    {
        _cleanString();
        return base.SaveChanges();
    }

    public override int SaveChanges(bool acceptAllChangesOnSuccess)
    {
        _cleanString();
        return base.SaveChanges(acceptAllChangesOnSuccess);
    }

    public override Task<int> SaveChangesAsync(bool acceptAllChangesOnSuccess,
        CancellationToken cancellationToken = default)
    {
        _cleanString();
        return base.SaveChangesAsync(acceptAllChangesOnSuccess, cancellationToken);
    }

    public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        _cleanString();
        return base.SaveChangesAsync(cancellationToken);
    }

    private void _cleanString()
    {
        var deletedEntity = ChangeTracker.Entries()
            .Where(x => x.State == EntityState.Deleted);
        foreach (var entry in deletedEntity)
        {
            if (entry is not { State: EntityState.Deleted, Entity: ISoftDelete delete }) continue;
            entry.State = EntityState.Modified;
            delete.IsDeleted = true;
            delete.DeletedAt = DateTimeOffset.UtcNow;
        }

        var changedEntities = ChangeTracker.Entries()
            .Where(x => x.State == EntityState.Added || x.State == EntityState.Modified);
        foreach (var item in changedEntities)
        {
            if (item.Entity == null)
                continue;

            var properties = item.Entity.GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance)
                .Where(p => p.CanRead && p.CanWrite && p.PropertyType == typeof(string));

            foreach (var property in properties)
            {
                var propName = property.Name;
                var val = (string)property.GetValue(item.Entity, null)!;

                if (val.HasValue())
                {
                    var newVal = val.Fa2En().FixPersianChars();
                    if (newVal == val)
                        continue;
                    property.SetValue(item.Entity, newVal, null);
                }
            }
        }
    }
    
}

