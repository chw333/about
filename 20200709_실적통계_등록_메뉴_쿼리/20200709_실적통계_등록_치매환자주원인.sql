
---------------------------------- 단일원인 ----------------------------------

-- 단일원인 - 치매
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 1
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;


-- 단일원인 - 알츠하이머
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO
and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 1
and DOC.DIAG_CODE_NEW in ( '130','150','180','190','200','210' )
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;


-- 단일원인 - 혈관성
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO
and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 1
and DOC.DIAG_CODE_NEW in ( '380','600' )
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;


-- 단일원인 - 루이소체
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO
and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 1
and DOC.DIAG_CODE_NEW in ( '270','290' )
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;


-- 단일원인 - 파킨스
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO
and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 1
and DOC.DIAG_CODE_NEW = '590'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;


-- 단일원인 - 전측두엽
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO
and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 1
and DOC.DIAG_CODE_NEW in ( '270','290' )
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;


-- 단일원인 - 정상압뇌수두증
		

-- 단일원인 - 갑상선기능저하
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO
and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 1
and DOC.DIAG_CODE_NEW = '360'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;


-- 단일원인 - 알코올
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO
and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 1
and DOC.DIAG_CODE_NEW = '610'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;


-- 단일원인 - 물질/약물


-- 단일원인 - 주요우울증
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO
and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 1
and DOC.DIAG_CODE_NEW = '510'
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;

		
-- 단일원인 - 기타주원인
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO
and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 1
and DOC.DIAG_CODE_NEW in ( '200','220','310','570' )
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;

---------------------------------- 단일원인 ----------------------------------


---------------------------------- 복합원인 ----------------------------------

		
-- 복합원인 - 치매환자
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 2
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;

		
-- 복합원인 - 알츠하이머
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) = 2
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and REGEXP_LIKE(DOC.DIAG_CODE_NEW, '10|20|30|40|50|60|70|80|90|100|110|120|130|150|180|190|200|210|230|550|560|570|580')
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;


-- 복합원인 그외복합원인
select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and ( ( length(DOC.DIAG_CODE_NEW) - length(replace(DOC.DIAG_CODE_NEW, ',', '')) ) 1 ) >= 2
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;

---------------------------------- 복합원인 ----------------------------------


---------------------------------- 주원인확인불가 ----------------------------------


-- 주원인확인불가 
 select B.CODE, count(*) as CNT
from TB_INDEPTH_CNS A
inner join TB_ANSIM_CODE B on A.ANSIM_CODE = B.CODE
inner join (
select INDEPTH_NO, DIAG_CODE_NEW from(
select INDEPTH_NO, DIAG_CODE_NEW,
dense_rank() over(partition by INDEPTH_NO order by CNS_DATE desc) rnum
from TB_INDEPTH_CNS_2ND
where REAL_YN = 'Y'
) where rnum = 1
) DOC on A.NO = DOC.INDEPTH_NO and DOC.DIAG_CODE_NEW is null
where A.REAL_YN = 'Y' and A.RET_YN = 'N' and B.REAL_YN = 'Y'
and to_char(A.CNS_DATE, 'yyyy-mm-dd') between '1900-01-01' and '2020-07-31'
--and A.GENDER_CD = '001004001' 
and A.GUBUN_DEMENTIA = '5' 
group by B.CODE
order by B.CODE asc ;

---------------------------------- 주원인확인불가 ----------------------------------
