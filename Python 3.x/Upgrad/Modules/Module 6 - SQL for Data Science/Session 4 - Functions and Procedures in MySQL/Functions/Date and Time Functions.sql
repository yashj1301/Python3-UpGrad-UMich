
-- Date Time Functions

-- 1. Extraction Functions

SELECT DATE("2017-06-15 05:34:52") 'Date',TIME("2017-06-15 05:34:52") 'Time';

select day("2017-06-15 05:34:52") 'Day', week("2017-06-15 05:34:52") 'Week',
month("2017-06-15 05:34:52") 'Month',quarter("2017-06-15 05:34:52") 'Quarter',
year("2017-06-15 05:34:52") 'Year';

select hour("2017-06-15 05:34:52") 'Hour',minute("2017-06-15 05:34:52") 'Minute',
second("2017-06-15 05:34:52") 'Second',
microsecond("2017-06-15 05:34:52.000021") 'MicroSecond';

select current_date() 'current date', current_time() 'current time',
current_timestamp() 'current timestamp';

select dayofweek("2017-06-15 05:34:52") 'Week Day no.',
dayofmonth("2017-06-15 05:34:52") 'Month Day no.',
dayofyear("2017-06-15 05:34:52") 'Year Day no.';

select dayofweek("2017-06-15 05:34:52") 'Day',dayname("2017-06-15 05:34:52") 'Name of Day',
month("2017-06-15 05:34:52") 'Month',monthname("2017-06-15 05:34:52") 'Name of Month';
-- here, Sunday is taken as week day 1

select weekday("2017-06-15 05:34:52") 'Week Day', 
weekofyear("2017-06-15 05:34:52") 'Week Year',
yearweek("2017-06-15 05:34:52") 'Year and Week';
-- here, monday is taken as week 0

select extract(year_month from "2017-06-15 05:34:52") 'Year and Month',
extract(DAY_SECOND from "2017-06-15 05:34:52") 'Day, Hour, Minute and Second'; 

-- 2. Operation Functions

select "2017-06-15" as date, 
adddate("2017-06-15",interval 2 quarter) 'Adding 2 quarters',
subdate("2017-06-15",interval 20 day) 'Subtracting 20 days';

select "2017-06-15 05:34:52" as time,
addtime("2017-06-15 05:34:52","02:34:12") 'Adding Time',
subtime("2017-06-15 05:34:52","05:41:38") 'Subtracting Time';

select datediff("2019-04-02","2017-06-15") 'date1 - date2',
timediff("14:32:50","03:18:04") 'time1 - time2';

select date_format("2019-04-02","%a, %D %M %Y") 'date1',
date_format("2019-04-02","%d-%b-%y") 'date2',
date_format("2019-04-02","%D %M %Y") 'date3',
date_format("2019-04-02","%W, %D %M %Y") 'date4',
date_format("2019-04-02 15:32:18","%d/%m/%Y, %r") 'date5',
date_format("2019-04-02 15:32:18","%d %b %Y, %T") 'date6';

select time_format("2019-04-02 13:41:22","%r") '12h Format',
time_format("2019-04-02 13:41:22.5","%T") '24h Format (original)';

select makedate(2022,162) 'Created Date', maketime(13,52,36) 'Created Time';

select 201703 as period_1,period_add(201703,14) 'period_2 (added)',
period_diff(201805,201703) 'period_diff';

