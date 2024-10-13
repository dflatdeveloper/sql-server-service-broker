﻿USE ServiceBrokerB

CREATE QUEUE [dbo].[QueueB_Out]
WITH STATUS = ON,
ACTIVATION (STATUS = ON, 
			PROCEDURE_NAME = [dbo].[QueueB_OutActivationSProc],
			EXECUTE AS SELF,
			MAX_QUEUE_READERS = 10);