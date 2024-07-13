SELECT * FROM d_prediction.`diabetes prediction1`;


-----Q1--------------------------------------
ALTER TABLE d_prediction.`diabetes prediction1` add Age int ;

UPDATE d_prediction.`diabetes prediction1`
SET Age = timestampdiff(year,str_to_date('D.O.B','%Y,%m,%d'),curdate()) ;


SELECT 
 Patient_id , Age
FROM d_prediction.`diabetes prediction1`;


--------Q2-----------------------------------

SELECT 
*
FROM d_prediction.`diabetes prediction1`
where gender='Female' and Age> 30;

---------Q3--------------------------
select
avg(bmi)
from d_prediction.`diabetes prediction_1`;

-------------Q4---------------
select
EmployeeName, blood_glucose_level
from d_prediction.`diabetes prediction1`
order by blood_glucose_level desc;

-------------Q5-------------------------

select
EmployeeName
from d_prediction.`diabetes prediction1`
where hypertension and diabetes >0;


------------------Q6----------------

select
count(heart_disease)
from d_prediction.`diabetes prediction1`
where heart_disease>0;


----------------Q7-------------------------

select
 smoking_history, count(EmployeeName) as Total_No_of_patients
from d_prediction.`diabetes prediction1`
group by smoking_history;



---------------------Q8------------------------

SELECT 
Patient_id
FROM d_prediction.`diabetes prediction1`
where bmi > (select avg(bmi) from d_prediction.`diabetes prediction1`);



------------------Q9-------------------------------------------------------------------

SELECT 
EmployeeName, Patient_id, HbA1c_level
FROM d_prediction.`diabetes prediction1` 
where HbA1c_level = (select max(HbA1c_level) from d_prediction.`diabetes prediction1` ) 
union
SELECT 
EmployeeName, Patient_id, HbA1c_level
FROM d_prediction.`diabetes prediction1` 
where HbA1c_level = (select min(HbA1c_level) from d_prediction.`diabetes prediction1` ) ;


----------------Q10------------------------------------------------------------

ALTER TABLE d_prediction.`diabetes prediction1` add Age int ;

UPDATE d_prediction.`diabetes prediction1`
SET Age = timestampdiff(year,str_to_date('D.O.B','%Y,%m,%d'),curdate()) ;

select
EmployeeName,Patient_id, Age
from d_prediction.`diabetes prediction1` ;

-----------------------Q11------------------------------------------

Select 
 EmployeeName, gender,blood_glucose_level, dense_rank() 
over ( partition by gender order by blood_glucose_level ) as 'rank' 
from d_prediction.`diabetes prediction1` ;

----------------------Q12----------------------------------------------------


UPDATE DATASET d_prediction.`diabetes prediction1` 
Set 'smoking_history' = 'Ex-smoker'
where Age >40;
select
*
from d_prediction.`diabetes prediction1` 
where 'smoking_history' ='Ex-smoker';






------------------------Q13-------------------------------------------------

Insert into d_prediction.`diabetes prediction1` 
values( 'Shashwati', 'PT1501', 'Female', '2020-10-04', 1, 0, 'never',19.85, 5.1,83,0,25);

select * from d_prediction.`diabetes prediction1` 
where 'EmployeeName'='Shashwati';

-----------------------Q14----------------------------------------

delete from d_prediction.`diabetes prediction1`
where heart_disease=1 ;

select 
heart_disease
From d_prediction.`diabetes prediction1` 
where heart_disease=1 ;


-----------------------------Q15-----------------------------------------

Select
EmployeeName, hypertension, diabetes
from d_prediction.`diabetes prediction1`
where hypertension = 1
except
Select
EmployeeName,hypertension, diabetes
from d_prediction.`diabetes prediction1`
where diabetes = 1;


----------------Q16------------------------------------------
ALTER TABLE d_prediction.`diabetes prediction1` MODIFY COLUMN Patient_id varchar(150) ;

ALTER TABLE d_prediction.`diabetes prediction1`
ADD CONSTRAINT Unique_Pid  UNIQUE (Patient_id) ;



---------------------------------Q17-------------------------------------

CREATE VIEW Patient_details AS 
Select
Patient_id, bmi, Age
from d_prediction.`diabetes prediction1`;

select * from Patient_details ;


