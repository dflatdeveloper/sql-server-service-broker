﻿CREATE QUEUE [dbo].[QueueB_In]
WITH STATUS = ON,
ACTIVATION (STATUS = ON, 
			PROCEDURE_NAME = [dbo].[QueueB_InActivationSProc],
			EXECUTE AS SELF,
			MAX_QUEUE_READERS = 10);