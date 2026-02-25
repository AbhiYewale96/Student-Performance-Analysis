use abhidb;

SELECT * FROM student_exam_scores;

SELECT student_id, hours_studied, exam_score
FROM student_exam_scores;

SELECT * FROM student_exam_scores
WHERE exam_score > 38;

SELECT * FROM student_exam_scores
WHERE attendance_percent > 75;

SELECT * FROM student_exam_scores
WHERE attendance_percent > 75
AND hours_studied > 8;

SELECT AVG(exam_score) AS avg_exam_score,
       MAX(exam_score) AS highest,
       MIN(exam_score) AS lowest,
       COUNT(*) AS total_students
FROM student_exam_scores;

SELECT attendance_percent,
       AVG(exam_score) AS avg_score
FROM student_exam_scores
GROUP BY attendance_percent;

SELECT hours_studied,
       AVG(exam_score) AS avg_score
FROM student_exam_scores
GROUP BY hours_studied;

SELECT * FROM student_exam_scores
ORDER BY exam_score DESC;

SELECT * FROM student_exam_scores
ORDER BY attendance_percent ASC;

SELECT attendance_percent,
       AVG(exam_score) AS avg_score
FROM student_exam_scores
GROUP BY attendance_percent
HAVING AVG(exam_score) > 40;

SELECT student_id, exam_score,
       CASE
           WHEN exam_score >= 38 THEN 'PASS'
           ELSE 'FAIL'
       END AS result
FROM student_exam_scores;

SELECT student_id, exam_score,
RANK() OVER (ORDER BY exam_score DESC) AS rank_position
FROM student_exam_scores;

SELECT * FROM student_exam_scores
WHERE exam_score >
      (SELECT AVG(exam_score)
       FROM student_exam_scores);









