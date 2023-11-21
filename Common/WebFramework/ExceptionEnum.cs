namespace Melad.Common.WebFramework;

public static class ExceptionEnum
{
    public const short UnhandledException = 600;
    public const short ApiVersioningNotSupport = 601;
    public const short LinqDynamicParseException = 602;
    public const short ModelValidationException = 603;
    public const short RateLimitException = 604;
    public const short ForceChangePasswordException = 605;
    public const short TaskSchedulerExecutionException = 606;
    public const short HafHttpCallException = 607;
    public const short PermissionAccessException = 608;
    public const short NotFoundException = 609;
    public const short HafException = 610;
    public const short HafIdentityException = 611;
    public const short HafSiloException = 612;
    public const short DuplicatedKey = 613;
    public const short RelationalEntityDeleteKey = 614;
    public const short SqlInjectionKey = 615;
    public const short UpdateConcurrency = 616;
    public const short AccessDenied = 618;
    public const short DriverNationalCodeNotFound = 620;
    public const short BookingPeriodNotFound = 621;
    public const short BookingTypeNotFound = 622;
    public const short CustomsNotFound = 623;
    public const short UnableToDeleteBookingPeriod = 624;
    public const short UnableToUpdateBookingPeriod = 625;
    public const short BookingNotFound = 626;
    public const short BookingPeriodIsBooked = 627;
    public const short DuplicateTitle = 628;
    public const short WarehouseNotFound = 629;
    public const short UnableToDeleteWarehouse = 630;
    public const short BookingPeriodIsAlreadyActive = 631;
    public const short BookingPeriodIsAlreadyDeactive = 632;
    public const short BookingPeriodIsInUse = 633;
    public const short UnableToCancelBookingInThisState = 634;
    public const short NotAllowed = 635;
    public const short RoleNotFound = 636;
    public const short SectionNotFound = 637;
    public const short BookingTypeTargetCannotBeChanged = 638;
    public const short WarehouseMustBeNull = 639;
    public const short YouDontHaveAnyUnassignedBooking = 640;
    public const short BookingIsAlreadyAssigned = 641;
    public const short ThisPeriodIsNotAssignable = 642;
    public const short UnableToDeleteBookingType = 643;

    public const short MapServiceProviderException = 650;
    public const short WrongStatusException = 651;
    public const short InvalidRequestException = 652;
    public const short WrongOtpException = 700;
}