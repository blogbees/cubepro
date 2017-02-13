package com.cubepro.student.attendance;

// Generated by MyEclipse Persistence Tools

import java.util.Date;

import com.cubepro.components.CubeProConstants;
import com.cubepro.student.StudentDetails;

/**
 * StudentAttendanceDetails generated by MyEclipse Persistence Tools
 */
public class StudentAttendanceDetails implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 246840355596378311L;

	private Integer attendanceId = Integer.valueOf(0);

	private String absentDate;

	private String absentDateString;

	private StudentDetails studentDetails;

	private String attendanceStatus;

	private String attendanceReason;

	private Date createDate;

	private Integer createUserId;

	private Date changeDate;

	private Integer changeUserId;
	
	private String isApproved = "N";

	// Constructors

	/** default constructor */
	public StudentAttendanceDetails() {
	}

	/** minimal constructor */
	public StudentAttendanceDetails(Integer attendanceId, String absentDate,
			StudentDetails studentDetails, String attendanceStatus,
			Date createDate, Integer createUserId) {
		this.attendanceId = attendanceId;
		this.absentDate = absentDate;
		this.studentDetails = studentDetails;
		this.attendanceStatus = attendanceStatus;
		this.createDate = createDate;
		this.createUserId = createUserId;
	}

	/** full constructor */
	public StudentAttendanceDetails(Integer attendanceId, String absentDate,
			StudentDetails studentDetails, String attendanceStatus,
			String attendanceReason, Date createDate, Integer createUserId,
			Date changeDate, Integer changeUserId) {
		this.attendanceId = attendanceId;
		this.absentDate = absentDate;
		this.studentDetails = studentDetails;
		this.attendanceStatus = attendanceStatus;
		this.attendanceReason = attendanceReason;
		this.createDate = createDate;
		this.createUserId = createUserId;
		this.changeDate = changeDate;
		this.changeUserId = changeUserId;
	}

	// Property accessors

	public Integer getAttendanceId() {
		return this.attendanceId;
	}

	public void setAttendanceId(Integer attendanceId) {
		this.attendanceId = attendanceId;
	}

	public String getAbsentDate() {
		return this.absentDate;
	}

	public void setAbsentDate(String absentDate) {
		this.absentDate = absentDate;
		if (absentDate != null) {
			this.absentDateString = absentDate;
		}

	}

	public String getAttendanceStatus() {
		return this.attendanceStatus;
	}

	public void setAttendanceStatus(String attendanceStatus) {
		this.attendanceStatus = attendanceStatus;
	}

	public String getAttendanceReason() {
		return this.attendanceReason;
	}

	public void setAttendanceReason(String attendanceReason) {
		this.attendanceReason = attendanceReason;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public Date getChangeDate() {
		return this.changeDate;
	}

	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}

	public Integer getChangeUserId() {
		return this.changeUserId;
	}

	public void setChangeUserId(Integer changeUserId) {
		this.changeUserId = changeUserId;
	}

	public StudentDetails getStudentDetails() {
		return studentDetails;
	}

	public void setStudentDetails(StudentDetails studentDetails) {
		this.studentDetails = studentDetails;
	}

	public String getAbsentDateString() {
		return absentDateString;
	}

	public void setAbsentDateString(String absentDateString) {
		this.absentDateString = absentDateString;
		if (absentDateString != null && absentDateString.trim().length() > 0) {
			this.absentDate = absentDateString;
		}

	}

	public String getIsApproved() {
		return isApproved;
	}

	public void setIsApproved(String isApproved) {
		this.isApproved = isApproved;
	}

}