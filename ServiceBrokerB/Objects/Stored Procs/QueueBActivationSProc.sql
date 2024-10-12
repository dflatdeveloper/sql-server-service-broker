USE ServiceBrokerB
GO

CREATE TYPE QUEUEB_RESULTS_TT
AS TABLE
(
    Msg NVARCHAR(MAX)
)
GO


CREATE OR ALTER PROCEDURE [dbo].[QueueBActivationSProc]
AS
	
    DECLARE @QueueB  QUEUEB_RESULTS_TT;
       
	RECEIVE message_body FROM dbo.QueueB  
    INTO @QueueB


    select * from @QueueB
   
	

RETURN 0
