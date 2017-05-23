package DAO;
// Generated 2017-5-17 9:58:01 by Hibernate Tools 5.2.1.Final

/**
 * Student generated by hbm2java
 */
public class Student implements java.io.Serializable {

	private Integer sid;
	private Grade grade;
	private String sname;
	private String gender;

	public Student() {
	}

	public Student(Grade grade, String sname, String gender) {
		this.grade = grade;
		this.sname = sname;
		this.gender = gender;
	}

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Grade getGrade() {
		return this.grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
