CREATE PROCEDURE [dbo].[QueueA_OutActivationSProc]
AS
	
    DECLARE @QueueA [dbo].[QUEUEA_RESULTS_TT];
       
	RECEIVE message_body FROM dbo.QueueA_Out 
    INTO @QueueA


    select * from @QueueA
   
	

RETURN 0
