USE nation;

/*A) Using MariaDB sum() function to calculate the sum of values*/
select sum(area)
from countries;
/*B) Using MariaDB sum() function with the group by clause example*/
select 
    region_id,
    sum(area) region_area
from
    countries
group by 
    region_id
order by 
    region_id;
/*To make the output more meaningful, you can join the countries table with the regions table:*/
select 
    regions.name region,
    sum(area) region_area
from
    countries
inner join regions
    using (region_id)
group by 
    regions.name
order by 
    region;
/*C) Using MariaDB sum() function with the having clause*/
select 
    regions.name regions,
    sum(area) region_area
from
    countries
inner join regions
    using (region_id)
group by 
    regions.name
having 
    sum(area) > 10000000
order by 
    region_area;