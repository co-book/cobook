SELECT m1.MYBOOK_NO, m1.MEMBER_NO, m1.TITLE, m1.CONTENTS, m1.HIT, m1.Reg_date,
m2.member_no AS "회원번호", m2.nickname AS "닉네임"
 FROM (
    SELECT ROWNUM AS rn,
        MYBOOK_NO, MEMBER_NO, TITLE, CONTENTS, HIT, Reg_date
     FROM MYBOOK
    ORDER BY MYBOOK_NO DESC) m1, member m2
WHERE rn >= 15 AND rownum <= 10
AND m1.member_no = m2.member_no;

SELECT m1.MYBOOK_NO, m1.MEMBER_NO, m1.TITLE, m1.CONTENTS, m1.HIT, m1.Reg_date,
m2.member_no AS "회원번호", m2.nickname AS "닉네임"
FROM (
	SELECT  ROWNUM AS rn,
		MYBOOK_NO, MEMBER_NO, TITLE, CONTENTS, HIT, Reg_date
	 FROM (
	 		SELECT * FROM mybook ORDER BY mybook_no desc
	 	   ) 
) m1, member m2
WHERE rn >= 1 AND rownum <= 10
AND m1.member_no = m2.member_no