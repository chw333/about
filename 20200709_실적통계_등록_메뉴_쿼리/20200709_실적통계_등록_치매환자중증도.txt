
-- 경도
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CDR, DIAG_GDS from(
select INDEPTH_NO, DIAG_CDR, DIAG_GDS,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and ( ( DIAG_CDR = '0.5' or DIAG_CDR = '1' ) or ( DIAG_GDS = '3' or DIAG_GDS = '4' ) )
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 중증도
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CDR, DIAG_GDS from(
select INDEPTH_NO, DIAG_CDR, DIAG_GDS,
dense_rank() over(partition by INDEPTH_NO order by NO desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and ( DIAG_CDR = '2' or ( DIAG_GDS = '5' or DIAG_GDS = '6' ) )
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 중증
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CDR, DIAG_GDS from(
select INDEPTH_NO, DIAG_CDR, DIAG_GDS,
dense_rank() over(partition by INDEPTH_NO order by NO desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and ( ( DIAG_CDR = '3' or DIAG_CDR = '4' or DIAG_CDR = '5' ) or DIAG_GDS = '7' )
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;


-- 중증도 확인 불가
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CDR, DIAG_GDS from(
select INDEPTH_NO, DIAG_CDR, DIAG_GDS,
dense_rank() over(partition by INDEPTH_NO order by NO desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and ( ( DIAG_CDR is null or DIAG_GDS is null ) or ( DIAG_GDS = '1' or DIAG_GDS = '2' ) )
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y' and
to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5'
group by B.CODE
order by B.CODE asc ;

		