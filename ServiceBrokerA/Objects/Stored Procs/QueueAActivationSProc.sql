USE ServiceBrokerA
GO

CREATE TYPE QUEUEA_RESULTS_TT
AS TABLE
(
    Msg NVARCHAR(MAX)
)
GO


CREATE OR ALTER PROCEDURE [dbo].[QueueAActivationSProc]
AS
	
    DECLARE @QueueA  [dbo].[QUEUEA_RESULTS_TT];
       
	RECEIVE message_body FROM dbo.QueueA  
    INTO @QueueA


    select * from @QueueA
   
	

RETURN 0
