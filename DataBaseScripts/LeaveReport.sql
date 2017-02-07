SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[amec_leave_exportall]
@year int, 
@month int
as
Begin

	DECLARE @dateCols nvarchar(max)	
	DECLARE @sqlStr nvarchar(max)
	DECLARE @monthStr AS varchar(2)
	DECLARE @YearStr AS varchar(4)

set @monthStr = RIGHT('0' + CAST(@month AS VARCHAR(2)), 2)
set @YearStr = CONVERT(varchar(4), @year)

	CREATE TABLE #tempExport(
 nt_id varchar(15)
 ,[1] varchar(25)
 ,[2] varchar(25)
 ,[3] varchar(25)
 ,[4] varchar(25)
 ,[5] varchar(25)
 ,[6] varchar(25)
 ,[7] varchar(25)
 ,[8] varchar(25)
 ,[9] varchar(25)
 ,[10] varchar(25)
 ,[11] varchar(25)
 ,[12] varchar(25)
 ,[13] varchar(25)
 ,[14] varchar(25)
 ,[15] varchar(25)
 ,[16] varchar(25)
 ,[17] varchar(25)
 ,[18] varchar(25)
 ,[19] varchar(25)
 ,[20] varchar(25)
 ,[21] varchar(25)
 ,[22] varchar(25)
 ,[23] varchar(25)
 ,[24] varchar(25)
 ,[25] varchar(25)
 ,[26] varchar(25)
 ,[27] varchar(25)
 ,[28] varchar(25)
 ,[29] varchar(25)
 ,[30] varchar(25)
 ,[31] varchar(25)
 );
	

	--select @dateCols = COALESCE(@dateCols+',','')+ '['+ convert(varchar,leave_date) +']' from amec_leaves where month(leave_date) = @month and year(leave_date) = @year group by leave_date order by leave_date
	
	--;WITH N(N)AS 
	--(SELECT 1 FROM(VALUES(1),(1),(1),(1),(1),(1))M(N)),
	--tally(N)AS(SELECT ROW_NUMBER()OVER(ORDER BY N.N)FROM N,N a)
	--SELECT @dateCols = COALESCE(@dateCols+',','') +  '['+ convert(varchar,datefromparts(@year,@month,N)) +']' FROM tally
	--WHERE N <= day(EOMONTH(datefromparts(@year,@month,1)))

	set @dateCols = '['+@YearStr+'-'+@monthStr+'-01],['+@YearStr+'-'+@monthStr+'-02],['+@YearStr+'-'+@monthStr+'-03],['+@YearStr+'-'+@monthStr+'-04],['+@YearStr+'-'+@monthStr+'-05],['+@YearStr+'-'+@monthStr+'-06],['+@YearStr+'-'+@monthStr+'-07],['+@YearStr+'-'+@monthStr+'-08],['+@YearStr+'-'+@monthStr+'-09],['+@YearStr+'-'+@monthStr+'-10],['+@YearStr+'-'+@monthStr+'-11],['+@YearStr+'-'+@monthStr+'-12],['+@YearStr+'-'+@monthStr+'-13],['+@YearStr+'-'+@monthStr+'-14],['+@YearStr+'-'+@monthStr+'-15],['+@YearStr+'-'+@monthStr+'-16],['+@YearStr+'-'+@monthStr+'-17],['+@YearStr+'-'+@monthStr+'-18],['+@YearStr+'-'+@monthStr+'-19],['+@YearStr+'-'+@monthStr+'-20],['+@YearStr+'-'+@monthStr+'-21],['+@YearStr+'-'+@monthStr+'-22],['+@YearStr+'-'+@monthStr+'-23],['+@YearStr+'-'+@monthStr+'-24],['+@YearStr+'-'+@monthStr+'-25],['+@YearStr+'-'+@monthStr+'-26],['+@YearStr+'-'+@monthStr+'-27],['+@YearStr+'-'+@monthStr+'-28],['+@YearStr+'-'+@monthStr+'-29],['+@YearStr+'-'+@monthStr+'-30],['+@YearStr+'-'+@monthStr+'-31]' ;

	set @sqlStr = 'Insert into #tempExport select * from (select nt_id,' + @dateCols + ' from
	( 
	select nt_id, leave_type_desc +''-''+ leave_date_type as leave_type_ex, CONVERT(VARCHAR(10), leave_date, 126) as leave_dates from amec_leaves where month(leave_date) = '+ CONVERT(varchar(2), @month) +' and year(leave_date) = '+CONVERT(varchar(4), @year) +') as src
	pivot
	(
	max(leave_type_ex) for leave_dates in ('+ @dateCols +')
	)as pv) as x';

	--select @sqlStr
	exec sp_executesql @sqlStr
	
	--select * from #tempExport
	Select t.team_desc,m.given_name, e.* from #tempExport e join amec_members m on e.nt_id = m.nt_id join amec_teams t on m.team_id = t.team_id order by team_desc,given_name

end
GO

exec amec_leave_exportall 2017,2

