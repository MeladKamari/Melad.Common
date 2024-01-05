using System.Reflection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.Filters;
using Swashbuckle.AspNetCore.SwaggerGen;
using Swashbuckle.AspNetCore.SwaggerUI;
using Path = System.IO.Path;
using ServiceCollectionExtensions = Swashbuckle.AspNetCore.Filters.ServiceCollectionExtensions;

namespace Melad.Common.WebFramework.Swagger;

public static class InstallSwagger
{
    public static IServiceCollection AddSwagger(this IServiceCollection services,string oauthAddress)
    {
        Guard.Against.Null(services, nameof(services));
        Guard.Against.NullOrEmpty(oauthAddress,"oauthAddress is Required");
        #region AddSwaggerExamples
        var mainAssembly = Assembly.GetEntryAssembly(); 
        Guard.Against.Null(mainAssembly, nameof(mainAssembly));
        var mainType = mainAssembly.GetExportedTypes()[0];
        const string methodName = nameof(ServiceCollectionExtensions.AddSwaggerExamplesFromAssemblyOf);
        var method = typeof(ServiceCollectionExtensions).GetRuntimeMethods()
            .FirstOrDefault(x => x.Name == methodName && x.IsGenericMethod);
        Guard.Against.Null(method, nameof(method));
        var generic = method.MakeGenericMethod(mainType);
        generic.Invoke(null, new[] { services });
        #endregion
        services.AddSwaggerGen(options =>
        {
            var xmlDocPath = Path.Combine(AppContext.BaseDirectory, $"{mainAssembly.GetName().Name}.xml");
            options.IncludeXmlComments(xmlDocPath, true);
            options.EnableAnnotations();
            #region DescribeAllEnumsAsStrings
            //This method was Deprecated. 
            //options.DescribeAllEnumsAsStrings();
            //You can specify an enum to convert to/from string, uisng :
            //[JsonConverter(typeof(StringEnumConverter))]
            //public virtual MyEnums MyEnum { get; set; }
            //Or can apply the StringEnumConverter to all enums globaly, using :
            //Used in ServiceCollectionExtensions.AddMinimalMvc
            //.AddNewtonsoftJson(option => option.SerializerSettings.Converters.Add(new StringEnumConverter()));
            #endregion
            options.SwaggerDoc("v1", new OpenApiInfo { Version = "v1", Title = "API V1" });
            options.SwaggerDoc("v2", new OpenApiInfo { Version = "v2", Title = "API V2" });
            options.SwaggerDoc("v3", new OpenApiInfo { Version = "v3", Title = "API V3" });
            options.SwaggerDoc("v4", new OpenApiInfo { Version = "v4", Title = "API V4" });
            options.SwaggerDoc("v5", new OpenApiInfo { Version = "v5", Title = "API V5" });
            #region Filters
            options.ExampleFilters();
            options.OperationFilter<ApplySummariesOperationFilter>();
            #region Add UnAuthorized to Response
            //Add 401 response and security requirements (Lock icon) to actions that need authorization
            options.OperationFilter<UnauthorizedResponsesOperationFilter>(true, "OAuth2");
            #endregion
            #region Add Jwt Authentication
            //Add Lockout icon on top of swagger ui page to authenticate
            #region Old way
            //options.AddSecurityDefinition("Bearer", new ApiKeyScheme
            //{
            //    Description = "JWT Authorization header using the Bearer scheme. Example: \"Authorization: Bearer {token}\"",
            //    Name = "Authorization",
            //    In = "header"
            //});
            //options.AddSecurityRequirement(new Dictionary<string, IEnumerable<string>>
            //{
            //    {"Bearer", new string[] { }}
            //});
            #endregion
            //options.AddSecurityRequirement(new OpenApiSecurityRequirement
            //{
            //    {
            //        new OpenApiSecurityScheme
            //        {
            //            Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "OAuth2" }
            //        },
            //        Array.Empty<string>() //new[] { "readAccess", "writeAccess" }
            //    }
            //});
            //OAuth2Scheme
            options.AddSecurityDefinition("OAuth2", new OpenApiSecurityScheme
            {
                //Scheme = "Bearer",
                //In = ParameterLocation.Header,
                Type = SecuritySchemeType.OAuth2,
                Flows = new OpenApiOAuthFlows
                {
                    Password = new OpenApiOAuthFlow
                    {
                        TokenUrl = new Uri(oauthAddress, UriKind.Relative)
                        //AuthorizationUrl = new Uri("/api/v1/users/Token", UriKind.Relative)
                        //Scopes = new Dictionary<string, string>
                        //{
                        //    { "readAccess", "Access read operations" },
                        //    { "writeAccess", "Access write operations" }
                        //}
                    }
                }
            });

            #endregion

            #region Versioning
            options.OperationFilter<RemoveVersionParameters>();
            options.DocumentFilter<SetVersionInPaths>();
            options.DocInclusionPredicate((docName, apiDesc) =>
            {
                if (!apiDesc.TryGetMethodInfo(out var methodInfo)) return false;

                var versions = methodInfo.DeclaringType?
                    .GetCustomAttributes<ApiVersionAttribute>(true)
                    .SelectMany(attr => attr.Versions);
                Guard.Against.Null(versions, nameof(versions));

                return versions.Any(v => $"v{v}" == docName);
            });

            #endregion
            #endregion
        });
        return services;
    }


    public static IApplicationBuilder UseSwaggerAndUI(this IApplicationBuilder app)
    {
        Guard.Against.Null(app, nameof(app));
        app.UseSwagger();
        app.UseSwaggerUI(options =>
        {
            options.SwaggerEndpoint("/swagger/v1/swagger.json", "V1 Docs");
            options.SwaggerEndpoint("/swagger/v2/swagger.json", "V2 Docs");
            options.SwaggerEndpoint("/swagger/v3/swagger.json", "V3 Docs");
            options.SwaggerEndpoint("/swagger/v4/swagger.json", "V4 Docs");
            options.SwaggerEndpoint("/swagger/v5/swagger.json", "V5 Docs");
            #region Customizing
            options.DefaultModelRendering(ModelRendering.Example);
            options.DisplayOperationId();
            options.DisplayRequestDuration();
            options.DocExpansion(DocExpansion.None);
            #endregion
        });
        app.UseReDoc(options =>
        {
            options.SpecUrl("/swagger/v1/swagger.json");
            options.SpecUrl("/swagger/v2/swagger.json");
            options.SpecUrl("/swagger/v3/swagger.json");
            options.SpecUrl("/swagger/v4/swagger.json");
            options.SpecUrl("/swagger/v5/swagger.json");
            #region Customizing
            options.DocumentTitle = "Melad Kamari";
            options.EnableUntrustedSpec();
            options.ScrollYOffset(10);
            options.HideHostname();
            options.HideDownloadButton();
            options.ExpandResponses("200,201");
            options.RequiredPropsFirst();
            options.NoAutoAuth();
            options.PathInMiddlePanel();
            options.HideLoading();
            options.NativeScrollbars();
            options.DisableSearch();
            options.OnlyRequiredInSamples();
            options.SortPropsAlphabetically();
            #endregion
        });
        return app;
    }
}
