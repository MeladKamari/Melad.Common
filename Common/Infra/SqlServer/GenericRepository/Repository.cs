using System.Linq.Expressions;
using Melad.Common.Infra.Domains;
using Melad.Common.Infra.SqlServer.Context;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace Melad.Common.Infra.SqlServer.GenericRepository;

public class Repository<TEntity> : IRepository<TEntity> where TEntity : class ,IBaseEntity 
    
{
    protected readonly IDbContextCore _dbContextCore;

    public Repository(IDbContextCore dbContextCore)
    {
        _dbContextCore = dbContextCore;
        Entities = _dbContextCore.Set<TEntity>(); // City => Cities
    }

    public DbSet<TEntity> Entities { get; }
    public virtual IQueryable<TEntity> Table => Entities;
    public virtual IQueryable<TEntity> TableNoTracking => Entities.AsNoTracking();

    public virtual IQueryable<TEntity> TableNoTrackingWithIdentityResolution =>
        Entities.AsNoTrackingWithIdentityResolution();

    #region Async Method

    public virtual ValueTask<TEntity?> GetByIdAsync(CancellationToken cancellationToken, params object[] ids)
    {
        return Entities.FindAsync(ids, cancellationToken);
    }

    public virtual async Task AddAsync(TEntity entity, CancellationToken cancellationToken, bool saveNow = true)
    {
        Guard.Against.Null(entity, nameof(entity));
        await Entities.AddAsync(entity, cancellationToken).ConfigureAwait(false);
        if (saveNow)
            await _dbContextCore.SaveChangesAsync(cancellationToken).ConfigureAwait(false);
    }

    public virtual async Task AddRangeAsync(IEnumerable<TEntity> entities, CancellationToken cancellationToken,
        bool saveNow = true)
    {
        Guard.Against.Null(entities, nameof(entities));
        await Entities.AddRangeAsync(entities, cancellationToken).ConfigureAwait(false);
        if (saveNow)
            await _dbContextCore.SaveChangesAsync(cancellationToken).ConfigureAwait(false);
    }

    public virtual async Task UpdateAsync(TEntity entity, CancellationToken cancellationToken, bool saveNow = true)
    {
        Guard.Against.Null(entity, nameof(entity));
        Entities.Update(entity);
        if (saveNow)
            await _dbContextCore.SaveChangesAsync(cancellationToken).ConfigureAwait(false);
    }

    public virtual async Task UpdateRangeAsync(IEnumerable<TEntity> entities, CancellationToken cancellationToken,
        bool saveNow = true)
    {
        Guard.Against.Null(entities, nameof(entities));
        Entities.UpdateRange(entities);
        if (saveNow)
            await _dbContextCore.SaveChangesAsync(cancellationToken).ConfigureAwait(false);
    }

    public virtual async Task DeleteAsync(TEntity entity, CancellationToken cancellationToken, bool saveNow = true)
    {
        Guard.Against.Null(entity, nameof(entity));
        Entities.Remove(entity);
        if (saveNow)
            await _dbContextCore.SaveChangesAsync(cancellationToken).ConfigureAwait(false);
    }

    public virtual async Task DeleteRangeAsync(IEnumerable<TEntity> entities, CancellationToken cancellationToken,
        bool saveNow = true)
    {
        Guard.Against.Null(entities, nameof(entities));
        Entities.RemoveRange(entities);
        if (saveNow)
            await _dbContextCore.SaveChangesAsync(cancellationToken).ConfigureAwait(false);
    }

    #endregion

    #region Sync Methods

    public virtual TEntity GetById(params object[] ids)
    {
        return Entities.Find(ids)!;
    }

    public virtual void Add(TEntity entity, bool saveNow = true)
    {
        Guard.Against.Null(entity, nameof(entity));
        Entities.Add(entity);
        if (saveNow)
            _dbContextCore.SaveChanges();
    }

    public virtual void AddRange(IEnumerable<TEntity> entities, bool saveNow = true)
    {
        Guard.Against.Null(entities, nameof(entities));
        Entities.AddRange(entities);
        if (saveNow)
            _dbContextCore.SaveChanges();
    }

    public virtual void Update(TEntity entity, bool saveNow = true)
    {
        Guard.Against.Null(entity, nameof(entity));
        Entities.Update(entity);
        if (saveNow)
            _dbContextCore.SaveChanges();
    }

    public virtual void UpdateRange(IEnumerable<TEntity> entities, bool saveNow = true)
    {
        Guard.Against.Null(entities, nameof(entities));
        Entities.UpdateRange(entities);
        if (saveNow)
            _dbContextCore.SaveChanges();
    }

    public virtual void Delete(TEntity entity, bool saveNow = true)
    {
        Guard.Against.Null(entity, nameof(entity));
        Entities.Remove(entity);
        if (saveNow)
            _dbContextCore.SaveChanges();
    }

    public virtual void DeleteRange(IEnumerable<TEntity> entities, bool saveNow = true)
    {
        Guard.Against.Null(entities, nameof(entities));
        Entities.RemoveRange(entities);
        if (saveNow)
            _dbContextCore.SaveChanges();
    }

    #endregion

    #region Attach & Detach

    public virtual void Detach(TEntity entity)
    {
        Guard.Against.Null(entity, nameof(entity));
        var entry = _dbContextCore.Entry(entity);
        if (entry != null)
            entry.State = EntityState.Detached;
    }

    public virtual void Attach(TEntity entity)
    {
        Guard.Against.Null(entity, nameof(entity));
        if (_dbContextCore.Entry(entity).State == EntityState.Detached)
            Entities.Attach(entity);
    }

    #endregion

    #region Explicit Loading

    public virtual async Task LoadCollectionAsync<TProperty>(TEntity entity,
        Expression<Func<TEntity, IEnumerable<TProperty>>> collectionProperty, CancellationToken cancellationToken)
        where TProperty : class
    {
        Attach(entity);

        var collection = _dbContextCore.Entry(entity).Collection(collectionProperty);
        if (!collection.IsLoaded)
            await collection.LoadAsync().ConfigureAwait(false);
    }

    public virtual void LoadCollection<TProperty>(TEntity entity,
        Expression<Func<TEntity, IEnumerable<TProperty>>> collectionProperty)
        where TProperty : class
    {
        Attach(entity);
        var collection = _dbContextCore.Entry(entity).Collection(collectionProperty);
        if (!collection.IsLoaded)
            collection.Load();
    }

    public virtual async Task LoadReferenceAsync<TProperty>(TEntity entity,
        Expression<Func<TEntity, TProperty>> referenceProperty, CancellationToken cancellationToken)
        where TProperty : class
    {
        Attach(entity);
        var reference = _dbContextCore.Entry(entity).Reference(referenceProperty!);
        if (!reference.IsLoaded)
            await reference.LoadAsync().ConfigureAwait(false);
    }

    public virtual void LoadReference<TProperty>(TEntity entity, Expression<Func<TEntity, TProperty>> referenceProperty)
        where TProperty : class
    {
        Attach(entity);
        var reference = _dbContextCore.Entry(entity).Reference(referenceProperty!);
        if (!reference.IsLoaded)
            reference.Load();
    }
    #endregion
}

public interface IDbContextCore
{
    DbSet<TEntity> Set<TEntity>() where TEntity : class;
    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
    int SaveChanges();
    EntityEntry<TEntity> Entry<TEntity>(TEntity entity) where TEntity : class;

}
