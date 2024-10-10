BACKUP CERTIFICATE [TRANSPORT_CERT_MACHINEA] TO FILE = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\TRANSPORT_CERT_MACHINEA.cer'
WITH PRIVATE KEY
(
    FILE = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\TRANSPORT_CERT_MACHINEA.pfx',
    ENCRYPTION BY PASSWORD = 'Password123!@#',
    DECRYPTION BY PASSWORD = '**(34ader#$lqQEUer13'
)

BACKUP CERTIFICATE [TRANSPORT_CERT_MACHINEB] TO FILE = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\TRANSPORT_CERT_MACHINEB.cer'
WITH PRIVATE KEY
(
    FILE = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\TRANSPORT_CERT_MACHINEB.pfx',
    ENCRYPTION BY PASSWORD = 'Password123!@#',
    DECRYPTION BY PASSWORD = '**(34ader#$lqQEUer13'
)

BACKUP CERTIFICATE [DIALOG_CERT_SERVICEBROKERA] TO FILE = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\DIALOG_CERT_SERVICEBROKERA.cer'
WITH PRIVATE KEY
(
    FILE = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\DIALOG_CERT_SERVICEBROKERA.pfx',
    ENCRYPTION BY PASSWORD = 'Password123!@#',
    DECRYPTION BY PASSWORD = '**(34ader#$lqQEUer13'
)

BACKUP CERTIFICATE [DIALOG_CERT_SERVICEBROKERB] TO FILE = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\DIALOG_CERT_SERVICEBROKERB.cer'
WITH PRIVATE KEY
(
    FILE = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\DIALOG_CERT_SERVICEBROKERB.pfx',
    ENCRYPTION BY PASSWORD = 'Password123!@#',
    DECRYPTION BY PASSWORD = '**(34ader#$lqQEUer13'
)

BACKUP CERTIFICATE [DIALOG_CERT_SERVICEBROKERC] TO FILE = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\DIALOG_CERT_SERVICEBROKERC.cer'
WITH PRIVATE KEY
(
    FILE = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\DIALOG_CERT_SERVICEBROKERC.pfx',
    ENCRYPTION BY PASSWORD = 'Password123!@#',
    DECRYPTION BY PASSWORD = '**(34ader#$lqQEUer13'
)
