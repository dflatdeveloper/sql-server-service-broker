﻿GRANT CONNECT TO [User_$(SERVICE_BROKER_REMOTE)]


GRANT SEND ON SERVICE::[$(LOCAL_SERVICE_NAME)_In]
    TO [USER_$(SERVICE_BROKER_REMOTE)]

GRANT SEND ON SERVICE::[$(LOCAL_SERVICE_NAME)_Out]
    TO [USER_$(SERVICE_BROKER_REMOTE)]