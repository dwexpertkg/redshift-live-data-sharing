-- Connect to redshiftdb as opposed to the shared DB (consumer_sales) and use the cross database query notation ( <shareddatabase>.<schema>.<object> )


-- How do I know what I have access to. Users would be able to see shared data as well local data when they do metadata queries as follows...navigate metadata of shared data just like local data...
SELECT * FROM SVV_REDSHIFT_DATABASES;
SELECT * FROM SVV_REDSHIFT_SCHEMAS where database_name = 'consumer_sales';
SELECT * FROM SVV_REDSHIFT_TABLES where database_name = 'consumer_sales';

--actual data...
select * from consumer_sales.public.part;
select * from consumer_sales.public.supplier;
select * from consumer_sales.public.customer;
select * from consumer_sales.public.dwdate;
select * from consumer_sales.public.lineorder;