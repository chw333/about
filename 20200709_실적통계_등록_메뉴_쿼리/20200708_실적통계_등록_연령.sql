

--------------------------------  유형별 SQL -------------------------------------
/*

GENDER_CD ( 성별 )
 - 남 : 001004001
 - 여 : 001004002
GUBUN_DEMENTIA ( 검진결과 )
 - 5 : 치매
 - 4 : 경도인지장애
 - 3 : 정상
 - 2 : 진단미정
 - 1 : 인지저하 
 
HIGHRISK_YN : 고위험군 여부
INJI_YN : 인지저하 여부
DOCU_AGE : 만나이

*/

-- A. 본인
---------------------------------  지표 만 59세 이하   ------------------------------
--  1. 치매
 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' and A.DOCU_AGE < 60
group by B.CODE 
order by B.CODE asc ;
 
 
--  2. 고위험군 - 경도인지장애
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' and A.DOCU_AGE < 60
group by B.CODE 
order by B.CODE asc ;

-- 3. 고위험군 - 인지저하
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' and A.DOCU_AGE < 60
group by B.CODE 
order by B.CODE asc ;
 
-- 4. 집중검진대상 - 만75세 이상 독거

-- 5. 집중검진대상 - 만 75세

-- 6. 정상
 select B.CODE, count(*) as CNT 
 from TB_INDEPTH_CNS A 
 inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
 where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
 and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'  
 --and A.GENDER_CD = '001004001' 
 and A.GUBUN_DEMENTIA = '3' 
 and A.HIGHRISK_YN = 'N' 
 and A.INJI_YN = 'N' 
 and A.DOCU_AGE < 60
 group by B.CODE 
 order by B.CODE asc ;
 
 -- 7.진단미정 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
and A.DOCU_AGE < 60
group by B.CODE 
order by B.CODE asc ;

-- B. 보호자
-- 1. 가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015002', '001015004', '001015003', '001015015', '001015016', '001015016', '001015006', '001015005', '001015017', '001015018', '001015019', '001015020', '001015021', '001015007' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE < 60
group by B.CODE 
order by B.CODE asc ;

-- 2. 비가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015013', '001015008', '001015009', '001015010' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.DOCU_AGE < 60
group by B.CODE 
order by B.CODE asc ;

---------------------------------  지표 만 > 60~64   ------------------------------

--  1. 치매
 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
and ( A.DOCU_AGE between 60 and 64 )
group by B.CODE 
order by B.CODE asc ;
 
 
--  2. 고위험군 - 경도인지장애
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
and ( A.DOCU_AGE between 60 and 64 )
group by B.CODE 
order by B.CODE asc ;

-- 3. 고위험군 - 인지저하
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
and ( A.DOCU_AGE between 60 and 64 )
group by B.CODE 
order by B.CODE asc ;
 
-- 4. 집중검진대상 - 만75세 이상 독거

-- 5. 집중검진대상 - 만 75세

-- 6. 정상
 select B.CODE, count(*) as CNT 
 from TB_INDEPTH_CNS A 
 inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
 where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
 and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'  
 --and A.GENDER_CD = '001004001' 
 and A.GUBUN_DEMENTIA = '3' 
 and A.HIGHRISK_YN = 'N' 
 and A.INJI_YN = 'N' 
and ( A.DOCU_AGE between 60 and 64 )
 group by B.CODE 
 order by B.CODE asc ;
 
 -- 7.진단미정 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
and ( A.DOCU_AGE between 60 and 64 )
group by B.CODE 
order by B.CODE asc ;

-- B. 보호자
-- 1. 가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015002', '001015004', '001015003', '001015015', '001015016', '001015016', '001015006', '001015005', '001015017', '001015018', '001015019', '001015020', '001015021', '001015007' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
-- and A.GENDER_CD = '001004001' 
and ( A.DOCU_AGE between 60 and 64 )
group by B.CODE 
order by B.CODE asc ;

-- 2. 비가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015013', '001015008', '001015009', '001015010' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and ( A.DOCU_AGE between 60 and 64 )
group by B.CODE 
order by B.CODE asc ;

---------------------------------  지표 만 > 65~69   ------------------------------

--  1. 치매
 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
and ( A.DOCU_AGE between 65 and 69 ) 
group by B.CODE 
order by B.CODE asc ;
 
 
--  2. 고위험군 - 경도인지장애
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
and ( A.DOCU_AGE between 65 and 69 ) 
group by B.CODE 
order by B.CODE asc ;

-- 3. 고위험군 - 인지저하
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
and ( A.DOCU_AGE between 65 and 69 ) 
group by B.CODE 
order by B.CODE asc ;
 
-- 4. 집중검진대상 - 만75세 이상 독거

-- 5. 집중검진대상 - 만 75세

-- 6. 정상
 select B.CODE, count(*) as CNT 
 from TB_INDEPTH_CNS A 
 inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
 where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
 and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'  
 --and A.GENDER_CD = '001004001' 
 and A.GUBUN_DEMENTIA = '3' 
 and A.HIGHRISK_YN = 'N' 
 and A.INJI_YN = 'N' 
 and ( A.DOCU_AGE between 65 and 69 ) 
 group by B.CODE 
 order by B.CODE asc ;
 
 -- 7.진단미정 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
and ( A.DOCU_AGE between 65 and 69 ) 
group by B.CODE 
order by B.CODE asc ;

-- B. 보호자
-- 1. 가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015002', '001015004', '001015003', '001015015', '001015016', '001015016', '001015006', '001015005', '001015017', '001015018', '001015019', '001015020', '001015021', '001015007' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
-- and A.GENDER_CD = '001004001' 
and ( A.DOCU_AGE between 65 and 69 ) 
group by B.CODE 
order by B.CODE asc ;

-- 2. 비가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015013', '001015008', '001015009', '001015010' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and ( A.DOCU_AGE between 65 and 69 ) 
group by B.CODE 
order by B.CODE asc ;

---------------------------------  지표 만 > 70~74   ------------------------------


--  1. 치매
 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
and ( A.DOCU_AGE between 70 and 74 )
group by B.CODE 
order by B.CODE asc ;
 
 
--  2. 고위험군 - 경도인지장애
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
and ( A.DOCU_AGE between 70 and 74 ) 
group by B.CODE 
order by B.CODE asc ;

-- 3. 고위험군 - 인지저하
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
and ( A.DOCU_AGE between 70 and 74 )
group by B.CODE 
order by B.CODE asc ;
 
-- 4. 집중검진대상 - 만75세 이상 독거

-- 5. 집중검진대상 - 만 75세

-- 6. 정상
 select B.CODE, count(*) as CNT 
 from TB_INDEPTH_CNS A 
 inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
 where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
 and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'  
 --and A.GENDER_CD = '001004001' 
 and A.GUBUN_DEMENTIA = '3' 
 and A.HIGHRISK_YN = 'N' 
 and A.INJI_YN = 'N' 
 and ( A.DOCU_AGE between 70 and 74 )
 group by B.CODE 
 order by B.CODE asc ;
 
 -- 7.진단미정 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
and ( A.DOCU_AGE between 70 and 74 ) 
group by B.CODE 
order by B.CODE asc ;

-- B. 보호자
-- 1. 가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015002', '001015004', '001015003', '001015015', '001015016', '001015016', '001015006', '001015005', '001015017', '001015018', '001015019', '001015020', '001015021', '001015007' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
-- and A.GENDER_CD = '001004001' 
and ( A.DOCU_AGE between 70 and 74 ) 
group by B.CODE 
order by B.CODE asc ;

-- 2. 비가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015013', '001015008', '001015009', '001015010' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and ( A.DOCU_AGE between 70 and 74 )
group by B.CODE 
order by B.CODE asc ;

---------------------------------  지표 만 > 75~79   ------------------------------


--  1. 치매
 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
and ( A.DOCU_AGE between 75 and 79 )
group by B.CODE 
order by B.CODE asc ;
 
 
--  2. 고위험군 - 경도인지장애
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
and ( A.DOCU_AGE between 75 and 79 ) 
group by B.CODE 
order by B.CODE asc ;

-- 3. 고위험군 - 인지저하
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
and ( A.DOCU_AGE between 75 and 79 )
group by B.CODE 
order by B.CODE asc ;
 
--  4. 집중검진대상 - 만75세 이상 독거
select ANSIM_CODE as CODE, sum(cnt) as CNT from( 
select ANSIM_CODE, DOCU_AGE, COHAB_STAT_CD, count(distinct a.no) as cnt 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD from( 
select INDEPTH_NO, CNS_DATE, COHAB_STAT_CD, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by ANSIM_CODE, DOCU_AGE, COHAB_STAT_CD 
) where ( DOCU_AGE between 75 and 79 ) and COHAB_STAT_CD = '001014001' 
group by ANSIM_CODE order by ANSIM_CODE ;

-- 5. 집중검진대상 - 만 75세
select ANSIM_CODE as CODE, sum(cnt) as CNT from( 
select ANSIM_CODE, DOCU_AGE, COHAB_STAT_CD, count(distinct a.no) as cnt 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD from( 
select INDEPTH_NO, CNS_DATE, COHAB_STAT_CD, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'  
--and A.GENDER_CD = '001004001' 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by ANSIM_CODE, DOCU_AGE, COHAB_STAT_CD 
) where DOCU_AGE = 75 and ( COHAB_STAT_CD <> '001014001' or nvl( COHAB_STAT_CD, 0 ) <= 0 ) 
group by ANSIM_CODE order by ANSIM_CODE ;

-- 6. 정상
 select B.CODE, count(*) as CNT 
 from TB_INDEPTH_CNS A 
 inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
 where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
 and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'  
 --and A.GENDER_CD = '001004001' 
 and A.GUBUN_DEMENTIA = '3' 
 and A.HIGHRISK_YN = 'N' 
 and A.INJI_YN = 'N' 
 and DOCU_AGE between 75 and 79 
 group by B.CODE 
 order by B.CODE asc ;
 
 -- 7.진단미정 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
and DOCU_AGE between 75 and 79 
group by B.CODE 
order by B.CODE asc ;

-- B. 보호자
-- 1. 가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015002', '001015004', '001015003', '001015015', '001015016', '001015016', '001015006', '001015005', '001015017', '001015018', '001015019', '001015020', '001015021', '001015007' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
-- and A.GENDER_CD = '001004001' 
and DOCU_AGE between 75 and 79 
group by B.CODE 
order by B.CODE asc ;

-- 2. 비가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015013', '001015008', '001015009', '001015010' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and DOCU_AGE between 75 and 79 
group by B.CODE 
order by B.CODE asc ;

---------------------------------  지표 만 > 80~84   ------------------------------


--  1. 치매
 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
and ( A.DOCU_AGE between 80 and 84 )
group by B.CODE 
order by B.CODE asc ;
 
 
--  2. 고위험군 - 경도인지장애
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
and ( A.DOCU_AGE between 80 and 84 )
group by B.CODE 
order by B.CODE asc ;

-- 3. 고위험군 - 인지저하
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
and ( A.DOCU_AGE between 80 and 84 )
group by B.CODE 
order by B.CODE asc ;
 
--  4. 집중검진대상 - 만75세 이상 독거
select ANSIM_CODE as CODE, sum(cnt) as CNT from( 
select ANSIM_CODE, DOCU_AGE, COHAB_STAT_CD, count(distinct a.no) as cnt 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD from( 
select INDEPTH_NO, CNS_DATE, COHAB_STAT_CD, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by ANSIM_CODE, DOCU_AGE, COHAB_STAT_CD 
) where ( DOCU_AGE between 80 and 84 ) and COHAB_STAT_CD = '001014001' 
group by ANSIM_CODE order by ANSIM_CODE ;

-- 5. 집중검진대상 - 만 75세

-- 6. 정상
 select B.CODE, count(*) as CNT 
 from TB_INDEPTH_CNS A 
 inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
 where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
 and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'  
 --and A.GENDER_CD = '001004001' 
 and A.GUBUN_DEMENTIA = '3' 
 and A.HIGHRISK_YN = 'N' 
 and A.INJI_YN = 'N' 
 and A.DOCU_AGE between 80 and 84 
 group by B.CODE 
 order by B.CODE asc ;
 
 -- 7.진단미정 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
and A.DOCU_AGE between 80 and 84 
group by B.CODE 
order by B.CODE asc ;

-- B. 보호자
-- 1. 가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015002', '001015004', '001015003', '001015015', '001015016', '001015016', '001015006', '001015005', '001015017', '001015018', '001015019', '001015020', '001015021', '001015007' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE between 80 and 84 
group by B.CODE 
order by B.CODE asc ;

-- 2. 비가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015013', '001015008', '001015009', '001015010' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.DOCU_AGE between 80 and 84 
group by B.CODE 
order by B.CODE asc ;


---------------------------------  지표 만 > 85세 이상   ------------------------------


--  1. 치매
 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
and A.DOCU_AGE >= 85
group by B.CODE 
order by B.CODE asc ;
 
 
--  2. 고위험군 - 경도인지장애
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4' 
and A.DOCU_AGE >= 85
group by B.CODE 
order by B.CODE asc ;

-- 3. 고위험군 - 인지저하
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A inner 
join TB_ANSIM_CODE B 
on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and 
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2' 
and A.DOCU_AGE >= 85
group by B.CODE 
order by B.CODE asc ;
 
--  4. 집중검진대상 - 만75세 이상 독거
select ANSIM_CODE as CODE, sum(cnt) as CNT from( 
select ANSIM_CODE, DOCU_AGE, COHAB_STAT_CD, count(distinct a.no) as cnt 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select INDEPTH_NO, COHAB_STAT_CD from( 
select INDEPTH_NO, CNS_DATE, COHAB_STAT_CD, 
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum 
from TB_INDEPTH_CNS_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.INDEPTH_NO 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31' 
--and A.GENDER_CD = '001004001' 
and A.INJI_YN = 'N' 
and A.GUBUN_DEMENTIA in ( '2' , '3' ) 
and A.HIGHRISK_YN = 'Y' 
group by ANSIM_CODE, DOCU_AGE, COHAB_STAT_CD 
) where A.DOCU_AGE >= 85 and COHAB_STAT_CD = '001014001' 
group by ANSIM_CODE order by ANSIM_CODE ;

-- 5. 집중검진대상 - 만 75세

-- 6. 정상
 select B.CODE, count(*) as CNT 
 from TB_INDEPTH_CNS A 
 inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
 where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
 and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'  
 --and A.GENDER_CD = '001004001' 
 and A.GUBUN_DEMENTIA = '3' 
 and A.HIGHRISK_YN = 'N' 
 and A.INJI_YN = 'N' 
 and A.DOCU_AGE between 80 and 84 
 group by B.CODE 
 order by B.CODE asc ;
 
 -- 7.진단미정 
select B.CODE, count(*) as CNT 
from TB_INDEPTH_CNS A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '2' 
and A.HIGHRISK_YN = 'N' 
and A.INJI_YN = 'N' 
and A.DOCU_AGE >= 85 
group by B.CODE 
order by B.CODE asc ;

-- B. 보호자
-- 1. 가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015002', '001015004', '001015003', '001015015', '001015016', '001015016', '001015006', '001015005', '001015017', '001015018', '001015019', '001015020', '001015021', '001015007' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
-- and A.GENDER_CD = '001004001' 
and A.DOCU_AGE >= 85
group by B.CODE 
order by B.CODE asc ;

-- 2. 비가족
select B.CODE, count(*) as CNT 
from TB_PRO_INDEPTH A 
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE 
inner join ( 
select PRO_INDEPTH_NO, REL_PAT_CD from( 
select PRO_INDEPTH_NO, REL_PAT_CD, 
dense_rank() over(partition by PRO_INDEPTH_NO order by NO desc) rnum 
from TB_PRO_INDEPTH_2ND 
where REAL_YN = 'Y' 
) where rnum = 1 
) DOC on A.NO = DOC.PRO_INDEPTH_NO 
and DOC.REL_PAT_CD in ( '001015013', '001015008', '001015009', '001015010' ) 
             where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' 
and to_char( A.CNS_DATE, 'yyyy-mm-dd' ) between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.DOCU_AGE >= 85
group by B.CODE 
order by B.CODE asc ;