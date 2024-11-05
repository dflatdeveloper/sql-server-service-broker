IF CAST('$(GENERATE_ROUTES)' AS BIT) = 0
BEGIN
	PRINT 'SKIPPING ROUTE GENERATION'

	GOTO ROUTE_CREATION_COMPLETE
END

:r ".\Objects\Routes\Inbound Route.sql"
:r ".\Objects\Routes\Outbound Route.sql"

ROUTE_CREATION_COMPLETE:

:r ".\Objects\Remote Service Binding\Inbound Binding.sql"
:r ".\Objects\Remote Service Binding\Outbound Binding.sql"
:r ".\user\security\Grant Connect To Service.sql"
