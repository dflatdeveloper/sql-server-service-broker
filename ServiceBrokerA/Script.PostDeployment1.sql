IF CAST('$(GENERATE_ROUTES)' AS BIT) = 0
BEGIN
	PRINT 'SKIPPING ROUTE GENERATION'

	GOTO ROUTE_CREATION_COMPLETE
END

:r ".\Objects\Routes\Route_In.sql"
:r ".\Objects\Routes\Route_Out.sql"

ROUTE_CREATION_COMPLETE:

:r ".\Objects\Remote Service Binding\Create Inbound Binding.sql"
:r ".\Objects\Remote Service Binding\Create Outbound Binding.sql"
:r ".\user\security\Grant Connect To Service.sql"

