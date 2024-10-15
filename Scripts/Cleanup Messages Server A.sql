WHILE (1=1)
BEGIN
    DECLARE @CI UNIQUEIDENTIFIER;

    select TOP(1) @CI = conversation_handle
        FROM [ServiceBrokerA].[sys].[transmission_queue];

    IF (@@ROWCOUNT = 0)
    BEGIN
        BREAK;
    END

    END CONVERSATION @CI WITH CLEANUP
END

