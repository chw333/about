
---------------------------------- 등급없음 ----------------------------------

-- 등급없음 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008013'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 등급없음 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008013'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 등급없음 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008013'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 등급없음 - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.LEVEL_CD = '006008013'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 등급없음 - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD from(
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.LEVEL_CD = '006008013'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 등급없음 - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008013'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 등급없음 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008013'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 등급없음 ----------------------------------


---------------------------------- 1등급 ----------------------------------


-- 1등급 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;



-- 1등급 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 1등급 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 1등급 - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.LEVEL_CD = '006008001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 1등급 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD from(
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.LEVEL_CD = '006008001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 1등급 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 1등급 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 1등급 ----------------------------------


---------------------------------- 2등급 ----------------------------------


-- 2등급 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008002'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 2등급 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008002'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 2등급 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008002'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 2등급 - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.LEVEL_CD = '006008002'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 2등급 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD from(
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.LEVEL_CD = '006008002'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 2등급 - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008002'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 2등급 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008002'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 2등급 ----------------------------------


---------------------------------- 3등급 ----------------------------------


-- 3등급 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 3등급 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 3등급 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 3등급 - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.LEVEL_CD = '006008003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 3등급 - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD from(
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.LEVEL_CD = '006008003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 3등급 - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 3등급 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 3등급 ----------------------------------


---------------------------------- 4등급 ----------------------------------


-- 4등급 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 4등급 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 4등급 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 4등급 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.LEVEL_CD = '006008004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 4등급 - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD from(
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.LEVEL_CD = '006008004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 4등급 - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 4등급 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 4등급 ----------------------------------


---------------------------------- 5등급 ----------------------------------


-- 5등급 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008005'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 5등급 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008005'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 5등급 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008005'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 5등급 - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.LEVEL_CD = '006008005'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 5등급 - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD from(
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.LEVEL_CD = '006008005'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 5등급 - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008005'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 5등급 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008005'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 5등급 ----------------------------------


---------------------------------- 인지지원등급 ----------------------------------


-- 인지지원등급 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008011'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 인지지원등급 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008011'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 인지지원등급 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008011'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' and A.INJI_YN = 'Y' and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 인지지원등급 - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.LEVEL_CD = '006008011'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 인지지원등급 - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD from(
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.LEVEL_CD = '006008011'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 인지지원등급 - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008011'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 인지지원등급 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008011'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 인지지원등급 ----------------------------------


---------------------------------- 등급외A ----------------------------------


-- 등급외A - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008006'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 등급외A - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008006'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 등급외A - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008006'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 등급외A - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.LEVEL_CD = '006008006'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 등급외A - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD from(
select INDEPTH_NO, LEVEL_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.LEVEL_CD = '006008006'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 등급외A - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008006'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 등급외A - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008006'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 등급외A ----------------------------------


---------------------------------- 등급외B ----------------------------------


-- 등급외B - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 등급외B - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 등급외B - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 등급외B - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.LEVEL_CD = '006008007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 등급외B - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.LEVEL_CD = '006008007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 등급외B - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 등급외B - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 등급외B ----------------------------------


---------------------------------- 등급외C ----------------------------------


-- 등급외C - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008008'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 등급외C - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008008'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 등급외C - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008008'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 등급외C - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.LEVEL_CD = '006008008'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 등급외C - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.LEVEL_CD = '006008008'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 등급외C - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008008'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 등급외C - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008008'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 등급외C ----------------------------------


---------------------------------- 모름 ----------------------------------


-- 모름 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008012'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 모름 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008012'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 모름 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008012'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 모름 - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.LEVEL_CD = '006008012'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 모름 - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD from(
select INDEPTH_NO, COHAB_STAT_CD, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.LEVEL_CD = '006008012'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 모름 - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008012'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 모름 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, LEVEL_CD from(
select INDEPTH_NO, LEVEL_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.LEVEL_CD = '006008012'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 모름 ----------------------------------
