
CREATE CERTIFICATE TRANSPORT_CERT_MACHINEA
    AUTHORIZATION [dbo]
    ENCRYPTION BY PASSWORD = '**(34ader#$lqQEUer13'
    WITH SUBJECT='Instance certificate for machine A for transport security';

CREATE CERTIFICATE TRANSPORT_CERT_MACHINEB
    AUTHORIZATION [dbo]
    ENCRYPTION BY PASSWORD = '**(34ader#$lqQEUer13'
    WITH SUBJECT='Instance certificate for machine B for transport security';

CREATE CERTIFICATE DIALOG_CERT_SERVICEBROKERA
    AUTHORIZATION [dbo]
    ENCRYPTION BY PASSWORD = '**(34ader#$lqQEUer13'
    WITH SUBJECT='Database certificate for machine A for dialog security';

CREATE CERTIFICATE DIALOG_CERT_SERVICEBROKERB
    AUTHORIZATION [dbo]
    ENCRYPTION BY PASSWORD = '**(34ader#$lqQEUer13'
    WITH SUBJECT='Database certificate for machine B for dialog security';

CREATE CERTIFICATE DIALOG_CERT_SERVICEBROKERC
    AUTHORIZATION [dbo]
    ENCRYPTION BY PASSWORD = '**(34ader#$lqQEUer13'
    WITH SUBJECT='Database certificate for machine C for dialog security';