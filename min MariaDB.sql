USE nation;
/*A) Using MariaDB min() function to get the minimum value EXAMPLE*/
select min(area)
from countries;

/*To get the full information of countries that have the smallest areas, you use this query:*/
select
    name,
    area
from 
    countries
where area = (
    select min(area)
    from countries
);

/*B) Using MariaDB min() function with a group by clause example*/
select 
    region_id,
    min(area)
from 
    countries
group by 
    region_id;

/*To include the region name, you can join the table countries with the table regions as shown in the following query:*/
select 
    regions.name region,
    min(area)
from 
    countries
inner join regions
    using (region_id)
group by 
    regions.name
order by 
    region;
/*C) Using MariaDB min() function with a having clause example*/
select 
    regions.name region,
     min(area)
from countries
inner join regions
    using (region_id)
group by 
    regions.name
having
    min(area) < 100000 
order by 
    region;