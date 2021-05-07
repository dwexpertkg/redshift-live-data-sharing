--Create a datashare container for sharing objects
create datashare SalesShare;

--Add objects at desired granularities: schemas, tables, views incl materialized, and SQL UDFs
ALTER DATASHARE SalesShare ADD SCHEMA public;
ALTER DATASHARE SalesShare ADD TABLE public.part;
ALTER DATASHARE SalesShare ADD TABLE public.supplier;
ALTER DATASHARE SalesShare ADD TABLE public.customer;
ALTER DATASHARE SalesShare ADD TABLE public.dwdate;
ALTER DATASHARE SalesShare ADD TABLE public.lineorder;

--Add consumers within account different vpc
GRANT USAGE ON DATASHARE SalesShare TO NAMESPACE '<Consumer Name Space>';

-- OR

-- Add consumers in different account in the same region
GRANT USAGE ON DATASHARE SalesShare TO ACCOUNT '<Consumer Account Number>';

--VALIDATION
Select * from svv_datashares; -- every datashare object that is associated with this cluster.
Select * from svv_datashare_objects; -- what objects have been shared in the outbound  share
Select * from svv_datashare_consumers; -- which namesspaces...or clusters have i granted usage to saleshare...