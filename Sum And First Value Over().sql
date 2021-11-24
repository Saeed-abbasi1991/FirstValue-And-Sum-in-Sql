declare @tabletest table(id int,value numeric(18,3))

insert into @tabletest

			select 1,4
			union
			select 2,25
			union
			select 3,35
			union
			select 3,45
			union
			select 4,50
			union
			select 4,45
			union
			select 1,8


select   id
		,SUM(value)sumvalue
		,SUM(SUM(value)) over()sumalltable
		,SUM(SUM(value)) over(order by id desc)sum2
		,(SUM(value)*100)/(SUM(SUM(value)) over())[percent]
		--,FIRST_VALUE(value)
		--over(order by id)
from
 @tabletest
			group by id

			select *,FIRST_VALUE(value) over(partition by id order by id ) from @tabletest t

			select *,FIRST_VALUE(value) over(order by id ) from @tabletest t

			select *,sum(value) over(partition by id order by value) from @tabletest t