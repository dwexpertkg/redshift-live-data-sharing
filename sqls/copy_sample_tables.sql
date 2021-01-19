-- Copy tables 

-- Copy part
copy part from 's3://<S3 Bucket>/part-csv/part-csv.tbl' 
iam_role '<IAM Role>'
csv
null as '\000';

-- verify
select p_partkey, p_name, p_mfgr, p_category from part where p_mfgr is null;

-- Copy supplier
copy supplier from 's3://awssampledb/ssbgz/supplier.tbl' 
iam_role '<IAM Role>'
delimiter '|' 
gzip
region 'us-east-1';

-- Copy customer
-- Make sure to update the manifest file with the correct S3 bucket and folder
copy customer from 's3://<S3 Bucket>/customer-fw/customer-fw-manifest'
iam_role '<IAM Role>'
fixedwidth 'c_custkey:10, c_name:25, c_address:25, c_city:10, c_nation:15, c_region :12, c_phone:15,c_mktsegment:10'
maxerror 10 
acceptinvchars as '^'
manifest;

-- Copy dwdate
copy dwdate from 's3://<S3 Bucket>/dwdate-tab/dwdate-tab.tbl'
iam_role '<IAM Role>'
delimiter '\t' 
dateformat 'auto';

-- Copy lineorder
copy lineorder from 's3://awssampledb/load/lo/lineorder-multi.tbl' 
iam_role '<IAM Role>'
gzip
compupdate off
region 'us-east-1';

vacuum;
analyze;