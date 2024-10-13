CREATE PROCEDURE [dbo].[QueueB_InActivationSProc]
AS
	
    DECLARE @QueueB  QUEUEB_RESULTS_TT;
       
	RECEIVE message_body FROM dbo.QueueB_In  
    INTO @QueueB


    select * from @QueueB
   
	

RETURN 0
