namespace Melad.Common.Infra.Domains;

public interface IBaseEntity
{
}

public interface ICreateDate
{
    public DateTimeOffset CreateDate { get; set; }
}

public abstract class BaseEntity<TKey> : IBaseEntity<TKey>
{
    public TKey? Id { get; set; }
}

public interface IBaseEntity<TKey> : IBaseEntity
{
    TKey? Id { get; set; }
}

public abstract class BaseEntity : BaseEntity<int>
{
}

public interface ISoftDelete
{
    public bool IsDeleted { get; set; }
    public DateTimeOffset? DeletedAt { get; set; }

    public void Undo()
    {
        IsDeleted = false;
        DeletedAt = null;
    }
}
