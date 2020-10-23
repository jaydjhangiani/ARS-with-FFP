/* Formatted on 6/25/2019 3:27:29 PM (QP5 v5.149.1003.31008) */
CREATE OR REPLACE PROCEDURE pr_points (cust_ID       VARCHAR2,
                                       flt_points    NUMBER,
                                       flt_dest      VARCHAR2)
IS
   cust_points   NUMBER;
   cust_grade    VARCHAR2 (30);
BEGIN
   SELECT jp_pss_pnts_n
     INTO cust_points
     FROM tb_jt_prvlg
    WHERE jp_id_v = cust_Id;

   SELECT jp_pss_grd_v
     INTO cust_grade
     FROM tb_jt_prvlg
    WHERE jp_id_v = cust_Id;

   IF cust_grade = 'BLUE'
   THEN
      cust_points := cust_points + (flt_points * 5);

      UPDATE tb_jt_prvlg
         SET jp_pss_pnts_n = cust_points
       WHERE jp_id_v = cust_Id;
   ELSE
      IF cust_grade = 'GOLD'
      THEN
         cust_points := cust_points + (flt_points * 7.5);

         UPDATE tb_jt_prvlg
            SET jp_pss_pnts_n = cust_points
          WHERE jp_id_v = cust_Id;
      ELSE
         cust_points := cust_points + (flt_points * 10);

         UPDATE tb_jt_prvlg
            SET jp_pss_pnts_n = cust_points
          WHERE jp_id_v = cust_Id;
      END IF;
   END IF;

   IF flt_dest = 'DOM' AND cust_grade = 'BLUE'
   THEN
      UPDATE tb_jt_prvlg
         SET jp_pss_upgrd_v = 'FROM SUPER SAVE TO ECO FELX AVAILABLE'
       WHERE jp_id_v = cust_Id;
   ELSE
      IF flt_dest = 'INTL' AND cust_grade = 'BLUE'
      THEN
         UPDATE tb_jt_prvlg
            SET jp_pss_upgrd_v = 'UNAVAILABLE'
          WHERE jp_id_v = cust_Id;
      END IF;
   END IF;


   IF flt_dest = 'DOM' AND cust_grade = 'GOLD'
   THEN
      UPDATE tb_jt_prvlg
         SET jp_pss_upgrd_v = 'FROM SUPER SAVE TO ECO FELX AVAILABLE'
       WHERE jp_id_v = cust_Id;
   ELSE
      IF flt_dest = 'INTL' AND cust_grade = 'GOLD'
      THEN
         UPDATE tb_jt_prvlg
            SET jp_pss_upgrd_v = 'FROM SUPER SAVE TO ECO FELX AVAILABLE'
          WHERE jp_id_v = cust_Id;
      END IF;
   END IF;

   IF flt_dest = 'DOM' AND cust_grade = 'PLATINUM'
   THEN
      UPDATE tb_jt_prvlg
         SET jp_pss_upgrd_v = 'ECONOMY TO CLUB AVAILABLE + GOLD PRIVILEGES'
       WHERE jp_id_v = cust_Id;
   ELSE
      IF flt_dest = 'INTL' AND cust_grade = 'PLATINUM'
      THEN
         UPDATE tb_jt_prvlg
            SET jp_pss_upgrd_v =
                   'ECONOMY TO CLUB AVAILABLE + LOUNGE ACCESS + GOLD PRIVILEGES'
          WHERE jp_id_v = cust_Id;
      END IF;
   END IF;
END;
/