-- 집 > 치매 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD = '001012001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;



-- 집 > 경도인지장애

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD = '001012001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

	

-- 집 > 인지저하

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD = '001012001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

		

-- 집 > 만75세이상독거

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.RES_STAT_CD = '001012001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE >= 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

	

-- 집 > 만75세

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.RES_STAT_CD = '001012001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

	

-- 집 > 정상

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD = '001012001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 집 > 진단미정

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD = '001012001' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 주거복지시설 > 치매

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012008', '001012002', '001012010', '001012011' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;

		

-- 주거복지시설 > 경도인지장애

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012008', '001012002', '001012010', '001012011' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

		

-- 주거복지시설 > 인지저하

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012008', '001012002', '001012010', '001012011' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

	

-- 주거복지시설 > 만75세이상독거

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.RES_STAT_CD in ( '001012008', '001012002', '001012010', '001012011' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE >= 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		
-- 주거복지시설 > 75세

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, COHAB_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, COHAB_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.RES_STAT_CD in ( '001012008', '001012002', '001012010', '001012011' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		

-- 주거복지시설 > 정상

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012008', '001012002', '001012010', '001012011' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 주거복지시설 > 진단미정

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012008', '001012002', '001012010', '001012011' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

	

-- 장기요양시설 > 치매 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012004', '001012012', '001012013' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;

	
-- 장기요양시설 > 경도인지장애 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012004', '001012012', '001012013' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

		

-- 장기요양시설 > 인지저하

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012004', '001012012', '001012013' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

		

-- 장기요양시설 > 만75세이상독거

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.RES_STAT_CD in ( '001012004', '001012012', '001012013' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE >= 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		
-- 장기요양시설 > 만75세

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.RES_STAT_CD in ( '001012004', '001012012', '001012013' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		

-- 장기요양시설 > 정상

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012004', '001012012', '001012013' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		

-- 장기요양시설 > 진단미정

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012004', '001012012', '001012013' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

	

-- 노인보호전문기관 > 치매 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD = '001012009' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;

	

-- 노인보호전문기관 > 경도인지장애

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD = '001012009' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

		
-- 노인보호전문기관 > 인지저하

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD = '001012009' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

		

-- 노인보호전문기관 > 만75세이상독거

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.RES_STAT_CD = '001012009' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE >= 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

	

-- 노인보호전문기관 > 만75세

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.RES_STAT_CD = '001012009' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		

-- 노인보호전문기관 > 정상

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD = '001012009' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		
-- 노인보호전문기관 > 진단미정

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD = '001012009' 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

	

-- 병원 > 치매 

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012005', '001012014', '001012015' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE 
order by B.CODE asc ;

		

-- 병원 > 경도인지장애

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012005', '001012014', '001012015' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
group by B.CODE 
order by B.CODE asc ;

		
-- 병원 > 인지저하

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012005', '001012014', '001012015' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
group by B.CODE 
order by B.CODE asc ;

	

-- 병원 > 만75세이상독거

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.RES_STAT_CD in ( '001012005', '001012014', '001012015' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE >= 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		

-- 병원 > 만75세

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, COHAB_STAT_CD, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.RES_STAT_CD in ( '001012005', '001012014', '001012015' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE = 75 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by B.CODE 
order by B.CODE asc ;

		

-- 병원 > 정상

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012005', '001012014', '001012015' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '3' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

	

-- 병원 > 진단미정

select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE from( 
select INDEPTH_NO, RES_STAT_CD, CNS_DATE, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO and DOC.RES_STAT_CD in ( '001012005', '001012014', '001012015' ) 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
-- and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
group by B.CODE 
order by B.CODE asc ;

		
