namespace Melad.Common.WebFramework;
public class AppSetting
{
    public JwtSetting JwtSetting { get; set; } = null!;
    public IdentitySetting IdentitySetting { get; set; } = null!;
}

public record IdentitySetting
{
    public bool PasswordRequireDigit { get; set; }
    public int PasswordRequiredLength { get; set; }
    public bool PasswordRequireNonAlphanumeric { get; set; }
    public bool PasswordRequireUppercase { get; set; }
    public bool PasswordRequireLowercase { get; set; }
    public bool RequireUniqueEmail { get; set; }
}

public record JwtSetting
{
    public string SecretKey { get; set; } = null!;
    public string EncryptKey { get; set; } = null!;
    public string Issuer { get; set; } = null!;
    public string Audience { get; set; } = null!;
    public int NotBeforeMinutes { get; set; }
    public int ExpirationMinutes { get; set; }
}
