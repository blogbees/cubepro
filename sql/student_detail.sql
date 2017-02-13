select student_id,student_name, roll_no, "
			+ " date_format(dob,'%d/%m/%Y') as dob, date_format(doj,'%d/%m/%Y') as doj, father_name, "
			+ " mother_name, guardian_name, gender, address_1, address_2, city, state, zipCode, country, "
			+ " phone, mobile, cd.class_id, cd.class_name, cd.section_name, sd.course_ids, photo_link "
			+ " from student_details sd inner join class_details  cd on sd.class_id = cd.class_id and isActive = 1  