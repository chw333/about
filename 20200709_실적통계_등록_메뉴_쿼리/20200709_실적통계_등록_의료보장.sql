
---------------------------------- 건강보험 ----------------------------------

-- 건강보험 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 건강보험 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 건강보험 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 건강보험 - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, MED_SUP_CD from(
select INDEPTH_NO, COHAB_STAT_CD, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.MED_SUP_CD = '001017001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 건강보험 - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD, COHAB_STAT_CD from(
select INDEPTH_NO, MED_SUP_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.MED_SUP_CD = '001017001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 건강보험 - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


--건강보험 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017001'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 건강보험 ----------------------------------


---------------------------------- 의료급여1종 ----------------------------------


-- 의료급여1종 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 의료급여1종 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 의료급여1종 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 의료급여1종 - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, MED_SUP_CD from(
select INDEPTH_NO, COHAB_STAT_CD, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.MED_SUP_CD = '001017003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 의료급여1종 - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD, COHAB_STAT_CD from(
select INDEPTH_NO, MED_SUP_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.MED_SUP_CD = '001017003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 의료급여1종 - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 의료급여1종 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017003'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 의료급여1종 ----------------------------------


---------------------------------- 의료급여2종 ----------------------------------


-- 의료급여2종 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 의료급여2종 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 의료급여2종 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' a
nd A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 의료급여2종 - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, MED_SUP_CD from(
select INDEPTH_NO, COHAB_STAT_CD, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.MED_SUP_CD = '001017004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 의료급여2종 - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD, COHAB_STAT_CD from(
select INDEPTH_NO, MED_SUP_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.MED_SUP_CD = '001017004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 의료급여2종 - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 의료급여2종 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017004'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 의료급여2종 ----------------------------------


---------------------------------- 미가입 ----------------------------------


-- 미가입 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 미가입 - 경도인지장애
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.GUBUN_DEMENTIA = '4'
group by B.CODE
order by B.CODE asc ;


-- 미가입 - 인지저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.HIGHRISK_YN = 'Y' 
and A.INJI_YN = 'Y' 
and A.GUBUN_DEMENTIA = '2'
group by B.CODE
order by B.CODE asc ;


-- 미가입 - 만75세이상독거
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, COHAB_STAT_CD, MED_SUP_CD from(
select INDEPTH_NO, COHAB_STAT_CD, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD = '001014001' and DOC.MED_SUP_CD = '001017007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE >= 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 미가입 - 만75세
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD, COHAB_STAT_CD from(
select INDEPTH_NO, MED_SUP_CD, COHAB_STAT_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.COHAB_STAT_CD <> '001014001' and DOC.MED_SUP_CD = '001017007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.DOCU_AGE = 75
and A.INJI_YN = 'N'
and A.GUBUN_DEMENTIA in ( '2' , '3' )
and A.HIGHRISK_YN = 'Y'
group by B.CODE
order by B.CODE asc ;


-- 미가입 - 정상
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '3'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;


-- 미가입 - 진단미정
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, MED_SUP_CD from(
select INDEPTH_NO, MED_SUP_CD,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.MED_SUP_CD = '001017007'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001'
and A.GUBUN_DEMENTIA = '2'
and A.HIGHRISK_YN = 'N'
and A.INJI_YN = 'N'
group by B.CODE
order by B.CODE asc ;

---------------------------------- 미가입 ----------------------------------
