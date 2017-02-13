SELECT
     class_details.`class_name` AS class_details_class_name,
     class_details.`section_name` AS class_details_section_name,
     attendance_details.`attn_date` AS attendance_details_attn_date,
     nullif(attendance_details.`attn_status`,'Present') AS attendance_details_attn_status,
     attendance_details.`attn_reason` AS attendance_details_attn_reason,
     student_details.`student_name` AS student_details_student_name,
     student_details.`roll_no` AS student_details_roll_no,
     date_format(student_details.`dob`,'%d/%m/%Y') AS student_details_dob,
     date_format(student_details.`doj`,'%d/%m/%Y') AS student_details_doj,
     student_details.`father_name` AS student_details_father_name,
     student_details.`mobile` AS student_details_mobile,
     student_details.`gender` AS student_details_gender
FROM
     `class_details` class_details INNER JOIN `student_details` student_details ON class_details.`class_id` = student_details.`class_id`
     LEFT JOIN `attendance_details` attendance_details ON student_details.`student_id` = attendance_details.`student_id` 
     and date_format(attendance_details.attn_date,'%d/%m/%Y') >= $P{fromDate} and date_format(attendance_details.attn_date,'%d/%m/%Y') <= $P{toDate}  
     where student_details.isActive = 1 and class_details.class_id = $P{classId}