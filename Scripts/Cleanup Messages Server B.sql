SELECT TOP (1000) *, casted_message_body = 
CASE message_type_name WHEN 'X' 
  THEN CAST(message_body AS NVARCHAR(MAX)) 
  ELSE message_body 
END 
FROM [ServiceBrokerB].[sys].[transmission_queue]


WHILE (1=1)
BEGIN
    DECLARE @CI UNIQUEIDENTIFIER;

    select TOP(1) @CI = conversation_handle
        FROM [ServiceBrokerB].[sys].[transmission_queue];

    IF (@@ROWCOUNT = 0)
    BEGIN
        BREAK;
    END

    END CONVERSATION @CI WITH CLEANUP
END
