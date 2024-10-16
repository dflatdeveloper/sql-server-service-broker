﻿CREATE QUEUE [dbo].[QueueC_Out]
WITH STATUS = ON,
ACTIVATION (STATUS = ON, 
			PROCEDURE_NAME = [dbo].[QueueC_OutActivationSProc],
			EXECUTE AS SELF,
			MAX_QUEUE_READERS = 10);