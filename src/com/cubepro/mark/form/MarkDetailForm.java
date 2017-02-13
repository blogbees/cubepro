package com.cubepro.mark.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.exam.ExamDetails;
import com.cubepro.general.components.Log;
import com.cubepro.mark.MarkDetails;
import com.cubepro.student.StudentDetails;
import com.cubepro.subject.SubjectDetails;

public class MarkDetailForm extends CubeProActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3547283403335453612L;

	private StudentDetails searchStudentDetails = new StudentDetails();

	private List<ClassDetails> classList = new ArrayList<ClassDetails>();
	
	private List<ExamDetails> examList = new ArrayList<ExamDetails>();
	
	private List<SubjectDetails> subjectList = new ArrayList<SubjectDetails>();

	private List <List<MarkDetails>> markDetails = new ArrayList <List<MarkDetails>>();
	
	private long selectedExamId;

	public StudentDetails getSearchStudentDetails() {
		return searchStudentDetails;
	}

	public void setSearchStudentDetails(StudentDetails searchStudentDetails) {
		this.searchStudentDetails = searchStudentDetails;
	}

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

	/**
	 * Method to get the indexed element values of 'minorMembers' list.
	 * 
	 * @param index
	 * @return
	 */
	public List<MarkDetails> getMarkDetail(int index) {
		MarkDetails markDetail = new MarkDetails();
		List<MarkDetails> markList = new ArrayList<MarkDetails>();
		if (index >= markDetails.size()) {
			for (int count = 0; index > (markDetails.size() - 1); count++) {
				markList.add(new MarkDetails());
				markDetails.add(markList);
			}
		}
		List<MarkDetails> mark = markDetails.get(index);
		//try{
		//	markDetail = mark.get(0);
		//}catch(Exception e){
		//	Log.error(getClass(), "Excep occ", e);
		//}
		return mark;
	}

	public List <List<MarkDetails>> getMarkDetails() {
		return markDetails;
	}

	public void setMarkDetails(List <List<MarkDetails>> markDetails) {
		this.markDetails = markDetails;
	}

	public List<ExamDetails> getExamList() {
		return examList;
	}

	public void setExamList(List<ExamDetails> examList) {
		this.examList = examList;
	}

	public long getSelectedExamId() {
		return selectedExamId;
	}

	public void setSelectedExamId(long selectedExamId) {
		this.selectedExamId = selectedExamId;
	}

	public List<SubjectDetails> getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(List<SubjectDetails> subjectList) {
		this.subjectList = subjectList;
	}

}
