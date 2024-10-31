:setvar REMOTE_SERVICE_NAME_ "ServiceB"
:setvar SERVICE_BROKER_REMOTE "SERVICEBROKERB"
:setvar REMOTE_SERVICE_ADDRESS "TCP://SB-B.home.local:4022"
:setvar REMOTE_BROKER_ID "2a0ccde4-9f72-4f51-997d-13df134cb55e"

:r ".\Objects\Routes\Route_In.sql"
:r ".\Objects\Routes\Route_Out.sql"
:r ".\Objects\Remote Service Binding\Create Inbound Binding.sql"
:r ".\Objects\Remote Service Binding\Create Outbound Binding.sql"

:setvar REMOTE_SERVICE_NAME_ "ServiceC"
:setvar SERVICE_BROKER_REMOTE "SERVICEBROKERC"
:setvar REMOTE_SERVICE_ADDRESS "TCP://SB-A.home.local:4022"
:setvar REMOTE_BROKER_ID "165362eb-593b-41af-b7a1-b04ae00a1a0c"

:r ".\Objects\Routes\Route_In.sql"
:r ".\Objects\Routes\Route_Out.sql"
:r ".\Objects\Remote Service Binding\Create Inbound Binding.sql"
:r ".\Objects\Remote Service Binding\Create Outbound Binding.sql"
