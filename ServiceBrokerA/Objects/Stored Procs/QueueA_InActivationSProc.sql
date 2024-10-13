CREATE PROCEDURE [dbo].[QueueA_InActivationSProc]
AS
	
    DECLARE @QueueA [dbo].[QUEUEA_RESULTS_TT];
       
	RECEIVE message_body FROM dbo.QueueA_In 
    INTO @QueueA


    select * from @QueueA
   
	

RETURN 0
