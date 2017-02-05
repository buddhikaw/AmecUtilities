	declare @monthCols nvarchar(max)
	declare @sqlStr nvarchar(max)

	select @monthCols = COALESCE(@monthCols+',','')+ '['+ convert(varchar,leave_date) +']' from amec_leaves where month(leave_date) = 1 group by leave_date

	set @sqlStr = 'select nt_id,' + @monthCols + ' from
	( 
	select nt_id, leave_type_desc +''-''+ leave_date_type as leave_type_ex, leave_date from amec_leaves where month(leave_date) = 1
	) as src
	pivot
	(
	max(leave_type_ex) for leave_date in ('+ @monthCols +')
	)as pv';

	--select @sqlStr

	exec sp_executesql @sqlStr