Select * from svv_datashares; -- every datashare object that is associated with this cluster...in this case we have one datashare called salesshare which is an inbound share
Select * from svv_datashare_objects; -- what objects have been shared in the inbound share

--Go ahead and make some changes to the producer

--Create a local database and schema reference to the share objects
CREATE DATABASE consumer_sales FROM DATASHARE SalesShare
of NAMESPACE '<Producer Name Space>';

--Create a db user, choose and remember password
create user awsuser with password '<Some Password>';

--Grant permissions on shared databases and schemas to user and groups in the cluster
GRANT USAGE ON DATABASE consumer_sales TO awsuser;