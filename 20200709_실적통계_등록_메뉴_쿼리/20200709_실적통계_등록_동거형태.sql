
-- 독거 > 치매 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;

		

-- 독거 > 경도인지장애 > 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
--and A.GENDER_CD = '001004001'
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

		

-- 독거 > 인지저하 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
---- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

	

-- 독거 > 만75세이상독거 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE >= 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

				
-- 독거 > 만75세 
			 ;

		

-- 독거 > 정상 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 독거 > 진단미정 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 배우자 > 치매 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014002' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;

	
-- 배우자 > 경도인지장애 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014002' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

	

-- 배우자 > 인지저하 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014002' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
and A.GENDER_CD = '001004001'
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

		
-- 배우자 > 만75세이상독거 

-- 배우자 > 만75세 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and ( DOC.COHAB_STAT_CD <> '001014001' and DOC.COHAB_STAT_CD = '001014002' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		

-- 배우자 > 정상

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014002' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		
-- 배우자 > 진단미정 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014002' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 배우자와다른가족 > 치매

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014003' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;

		

배우자와다른가족 > 경도인지장애 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014003' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

		
-- 배우자와다른가족 > 인지저하 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014003' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

	

-- 배우자와다른가족 > 만75세이상독거 

			 

	
-- 배우자와다른가족 > 만75세 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and ( DOC.COHAB_STAT_CD <> '001014001' and DOC.COHAB_STAT_CD = '001014003' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		

-- 배우자와다른가족 > 정상 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014003' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

	

-- 배우자와다른가족 > 진단미정 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014003' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

	

-- 배우자없이가족만 > 치매 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014004' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;


-- 배우자없이가족만 > 경도인지장애 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014004' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

	

-- 배우자없이가족만 > 인지저하 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014004' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

		
-- 배우자없이가족만 > 만75세이상독거 


-- 배우자없이가족만 > 만75세 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and ( DOC.COHAB_STAT_CD <> '001014001' and DOC.COHAB_STAT_CD = '001014004' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

	

-- 배우자없이가족만 > 정상

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014004' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 배우자없이가족만 > 진단미정 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014004' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

 
-- 친인척 > 치매 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014005' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;

	

-- 친인척 > 경도인지장애 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014005' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

	

-- 친인척 > 인지저하

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014005' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

		

-- 친인척 > 만75세이상독거 

			 ;

	
-- 친인척 > 만75세

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and ( DOC.COHAB_STAT_CD <> '001014001' and DOC.COHAB_STAT_CD = '001014005' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

	

-- 친인척 > 정상

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014005' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
 order by B.CODE asc ;

		

-- 친인척 > 진단미정

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014005' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		
-- 배우자는아니나동거인 > 치매 
		

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014006' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;

	

-- 배우자는아니나동거인 > 경도인지장애

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014006' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
and A.GENDER_CD = '001004001'
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

	

-- 배우자는아니나동거인 > 인지저하

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014006' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
and A.GENDER_CD = '001004001'
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

	

-- 배우자는아니나동거인 > 만75세 이상 독거

			

-- 배우자는아니나동거인 > 만75세 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and ( DOC.COHAB_STAT_CD <> '001014001' and DOC.COHAB_STAT_CD = '001014006' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		

-- 배우자는아니나동거인 > 정상

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014006' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- -- 배우자는아니나동거인 > 진단미정

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014006' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 치매환자보호자와동거 > 치매 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014007' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;

	

-- 치매환자보호자와동거 > 경도인지장애

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014007' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

-- 치매환자보호자와동거 > 인지저하

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014007' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

	

-- 치매환자보호자와동거 > 만75세이상독거


-- 치매환자보호자와동거 > 만75세

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and ( DOC.COHAB_STAT_CD <> '001014001' and DOC.COHAB_STAT_CD = '001014007' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		
-- 치매환자보호자와동거 > 정상

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014007' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 치매환자보호자와동거 > 진단미정

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014007' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 기타 > 치매

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014008' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
 order by B.CODE asc ;

	

-- 기타 > 경도인지장애

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014008' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
and A.GENDER_CD = '001004001'
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

		

-- 기타 > 인지저하

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014008' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

		

-- 기타 > 만75세이상독거

			 ;

		
-- 기타 > 만75세

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and ( DOC.COHAB_STAT_CD <> '001014001' and DOC.COHAB_STAT_CD = '001014008' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		

-- 기타 > 정상

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014008' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 기타 > 진단미정

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014008' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-09' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		