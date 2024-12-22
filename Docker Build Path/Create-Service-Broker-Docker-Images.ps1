Get-Content .\Phase1\Dockerfile | docker buildx create --build-arg MY_SA_PWD_SHOULD_BE_MADE_INTO_SECRET_MOUNT_PASSWORD=password123!@# -t service.broker - 

docker run --mount=type=bind,source="C:\\Users\\dbms-\\source\\repos\\sql-server-service-broker\\database_volume",target=/var/opt/mssql/data -rm -p 1433:1433

docker cp "C:\Users\dbms-\source\repos\sql-server-service-broker\external-resources\certificates" service-broker:/var/opt/mssql/service-broker/

docker commit service-broker service.broker-v0.1

Get-Content .\Phase2\Dockerfile | docker buildx create -t service.broker-v0.2 -

docker run --mount=type=bind,source="C:\\Users\\dbms-\\source\\repos\\sql-server-service-broker\\database_volume",target=/var/opt/mssql/data -rm -p 1433:1433 -p 4022:4022 




