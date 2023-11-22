using MediatR.Pipeline;
using Microsoft.Extensions.Logging;
using Microsoft.Identity.Client;

namespace Melad.Common.WebFramework.Mediatr;

public class LoggingBehaviour<TRequest> : IRequestPreProcessor<TRequest> where TRequest : notnull
{
    private readonly ILogger _logger;

    public LoggingBehaviour(ILogger<TRequest> logger)
    {
        _logger = logger;
    }

    public Task Process(TRequest request, CancellationToken cancellationToken)
    {
        var requestName = typeof(TRequest).Name;
        string? userName = string.Empty;
        _logger.LogInformation("CleanArchitecture Request: {Name}  {@UserName} {@Request}",
            requestName,  userName, request);
        return Task.CompletedTask;
    }
}
