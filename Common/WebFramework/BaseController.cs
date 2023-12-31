﻿using Microsoft.AspNetCore.Mvc;

namespace Melad.Common.WebFramework;
/// <summary>
/// Base Controller
/// </summary>
[Route("api/v{version:apiVersion}/[controller]/[action]")]
[ApiVersion("1")]
[ApiController]
[ApiResultFilter]
public class BaseController : ControllerBase
{
    #region Fields
    public  IMediator _mediator;
    #endregion
    #region Ctor
    /// <summary>
    /// Creates a BaseController
    /// </summary>
    public BaseController(IMediator mediator)
    {
        _mediator = mediator;
    }
    #endregion
}
