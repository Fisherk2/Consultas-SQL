USE nation;
/*The following statement uses the group_concat() function to return the countries and their languages:*/
select 
    countries.name country,
    group_concat(language) languages
from 
    countries
inner join country_languages 
    using (country_id)
inner join languages 
    using (language_Id)
group by 
    country;
/*To sort the languages in each country, you use the order by clause in the group_concat() function:*/
select 
    countries.name country,
    group_concat(
        language
        order by language
    ) languages
from 
    countries
inner join country_languages 
    using (country_id)
inner join languages 
    using (language_Id)
group by 
    country;
/*To place the official language at the beginning and other languages at the end of the list, you use the order by clause:*/
select 
    countries.name country,
    group_concat(
        language
        order by 
            official desc, 
            language asc
    ) languages
from 
    countries
inner join country_languages 
    using (country_id)
inner join languages 
    using (language_Id)
group by 
    country;
/*If you want to use the separator (/) instead of the comma (,), you use the separator clause as shown in the following example:*/
select 
    countries.name country,
    group_concat(
        language
        order by 
            official desc, 
            language asc
        separator '/'
    ) languages
from 
    countries
inner join country_languages 
    using (country_id)
inner join languages 
    using (language_Id)
group by 
    country;