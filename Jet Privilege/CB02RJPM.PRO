/* Formatted on 6/25/2019 3:27:55 PM (QP5 v5.149.1003.31008) */
CREATE OR REPLACE PROCEDURE pr_redeem (cust_ID           VARCHAR2,
                                       flt_dest          VARCHAR2,
                                       UPGRADE_CHOICE    VARCHAR2)
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


   IF cust_grade = 'BLUE' AND flt_dest = 'DOM'
   THEN
      IF upgrade_choice = 'ECO'
      THEN
         cust_points := cust_points - 1500;

         IF cust_points > 5000
         THEN
            UPDATE tb_jt_prvlg
               SET jp_pss_pnts_n = jp_pss_pnts_n - 1500
             WHERE jp_id_v = cust_Id;

            UPDATE tb_jt_prvlg
               SET jp_pss_upgrd_v = 'UPGRADED TO ECO FLEX '
             WHERE jp_id_v = cust_Id;
         ELSE
            RAISE_APPLICATION_ERROR (
               -20001,
               'UPGRADE NOT ALLOWED AS POINTS AS CUSTOMER POINTS ARE BELOW 1500 !!!  ');
         END IF;
      ELSE
         raise_application_error (-20001, 'UPGRADE NOT ALLOWED !!! ');
      END IF;
   END IF;



   IF cust_grade = 'BLUE' AND flt_dest = 'INTL'
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'UPGRADE NOT ALLOWED !!! ');
   END IF;


   IF cust_grade = 'GOLD' AND flt_dest = 'DOM'
   THEN
      IF upgrade_choice = 'CLUB'
      THEN
         cust_points := cust_points - 4500;

         IF cust_points > 8000
         THEN
            UPDATE tb_jt_prvlg
               SET jp_pss_pnts_n = jp_pss_pnts_n - 4500
             WHERE jp_id_v = cust_Id;

            UPDATE tb_jt_prvlg
               SET jp_pss_upgrd_v = 'UPGRADED TO CLUB '
             WHERE JP_ID_v = cust_Id;
         ELSE
            RAISE_APPLICATION_ERROR (
               -20001,
               'UPGRADE NOT ALLOWED AS POINTS AS CUSTOMER POINTS ARE BELOW 8000 !!!  ');
         END IF;
      END IF;


      IF upgrade_choice = 'ECO'
      THEN
         cust_points := cust_points - 1000;

         IF cust_points > 8000
         THEN
            UPDATE tb_jt_prvlg
               SET jp_pss_pnts_n = jp_pss_pnts_n - 1000
             WHERE JP_ID_v = cust_Id;

            UPDATE tb_jt_prvlg
               SET jp_pss_upgrd_v = 'UPGRADED TO ECO FLEX '
             WHERE JP_ID_v = cust_Id;
         ELSE
            RAISE_APPLICATION_ERROR (
               -20001,
               'UPGRADE NOT ALLOWED AS POINTS AS CUSTOMER POINTS ARE BELOW 8000 !!!  ');
         END IF;
      END IF;
   END IF;

   IF cust_grade = 'GOLD' AND flt_dest = 'INTL'
   THEN
      IF upgrade_choice = 'ECO'
      THEN
         cust_points := cust_points - 2500;

         IF cust_points > 8000
         THEN
            UPDATE tb_jt_prvlg
               SET jp_pss_pnts_n = jp_pss_pnts_n - 2500
             WHERE JP_ID_v = cust_Id;

            UPDATE tb_jt_prvlg
               SET jp_pss_upgrd_v = 'UPGRADED TO ECO FLEX '
             WHERE JP_ID_v = cust_Id;
         ELSE
            RAISE_APPLICATION_ERROR (
               -20001,
               'UPGRADE NOT ALLOWED AS POINTS AS CUSTOMER POINTS ARE BELOW 8000 !!!  ');
         END IF;
      END IF;


      IF upgrade_choice = 'CLUB'
      THEN
         RAISE_APPLICATION_ERROR (-20001, 'UPGRADE NOT ALLOWED !!! ');
      END IF;
   END IF;

   IF cust_grade = 'PLATINUM' AND flt_dest = 'DOM'
   THEN
      IF upgrade_choice = 'CLUB'
      THEN
         cust_points := cust_points - 3500;

         IF cust_points > 5000
         THEN
            UPDATE tb_jt_prvlg
               SET jp_pss_pnts_n = jp_pss_pnts_n - 3500
             WHERE jp_id_v = cust_Id;

            UPDATE tb_jt_prvlg
               SET jp_pss_upgrd_v = 'UPGRADED TO CLUB '
             WHERE jp_id_v = cust_Id;
         ELSE
            RAISE_APPLICATION_ERROR (
               -20001,
               'UPGRADE NOT ALLOWED AS POINTS AS CUSTOMER POINTS ARE BELOW 5000 !!!  ');
         END IF;
      END IF;


      IF upgrade_choice = 'ECO'
      THEN
         cust_points := cust_points - 700;

         IF cust_points > 5000
         THEN
            UPDATE tb_jt_prvlg
               SET jp_pss_pnts_n = jp_pss_pnts_n - 700
             WHERE jp_id_v = cust_Id;

            UPDATE tb_jt_prvlg
               SET jp_pss_upgrd_v = 'UPGRADED TO ECO FLEX '
             WHERE jp_id_v = cust_Id;
         ELSE
            RAISE_APPLICATION_ERROR (
               -20001,
               'UPGRADE NOT ALLOWED AS POINTS AS CUSTOMER POINTS ARE BELOW 5000 !!!  ');
         END IF;
      END IF;
   END IF;

   IF cust_grade = 'PLATINUM' AND flt_dest = 'INTL'
   THEN
      IF upgrade_choice = 'CLUB'
      THEN
         cust_points := cust_points - 85000;

         IF cust_points > 5000
         THEN
            UPDATE tb_jt_prvlg
               SET jp_pss_pnts_n = jp_pss_pnts_n - 8500
             WHERE jp_id_v = cust_Id;

            UPDATE tb_jt_prvlg
               SET jp_pss_upgrd_v = 'UPGRADED TO CLUB + LOUNGE ACCESS '
             WHERE jp_id_v = cust_Id;
         ELSE
            RAISE_APPLICATION_ERROR (
               -20001,
               'UPGRADE NOT ALLOWED AS POINTS AS CUSTOMER POINTS ARE BELOW 5000 !!!  ');
         END IF;
      END IF;


      IF upgrade_choice = 'ECO'
      THEN
         cust_points := cust_points - 1500;

         IF cust_points > 5000
         THEN
            UPDATE tb_jt_prvlg
               SET jp_pss_pnts_n = jp_pss_pnts_n - 1500
             WHERE jp_id_v = cust_Id;

            UPDATE tb_jt_prvlg
               SET jp_pss_upgrd_v = 'UPGRADED TO ECO FLEX '
             WHERE jp_id_v = cust_Id;
         ELSE
            RAISE_APPLICATION_ERROR (
               -20001,
               'UPGRADE NOT ALLOWED AS POINTS AS CUSTOMER POINTS ARE BELOW 5000 !!!  ');
         END IF;
      END IF;
   END IF;
END;
/