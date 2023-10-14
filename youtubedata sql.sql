use ytchanneldata;
show tables;
select * from youtubedata;

#sql videos
select * from youtubedata where title_name like '%SQL%';

#Excel videos
select count(title_name) as MaxExcelVidoes from youtubedata where title_name like '%Excel%';

#which video got the highest views
select title_name, views from youtubedata order by views desc;

#which video got the best ratio from the number of likes to number of views
select title_name, (likes/views) as LikesRatio
from youtubedata
order by likesratio desc;

#distinct months
select distinct yearmonth from youtubedata;

#how many different topics got how many contents?
SELECT  case when title_name like '%ython%' then 'Python'
 when title_name like '%SQL%' then 'SQL'
 when title_name like '%ablea%' then 'Tableau'
 when title_name like '%xcel%' then 'Excel'
 when title_name like '%ower%' then 'Power BI'
else 'other' end as Type, count(*) as Total
 FROM youtubedata
group by type;

#yearmonth vs videos count
SELECT  yearmonth, count(*) as Total
 FROM youtubedata
group by yearmonth
order by Total desc;

#how many months have more than 1M views?
SELECT  yearmonth,sum(views)
 FROM youtubedata
group by yearmonth
having sum(views)>1000000
order by yearmonth;

#percentage change in oct and nov 2020
with final as (
SELECT  yearmonth,sum(views) as totalviews
 FROM youtubedata
where year=2020 and month in (10,11)
group by yearmonth
order by yearmonth desc)
select yearmonth, totalviews,lag(totalviews) over (order by yearmonth desc)
from final;







