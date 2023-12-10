package com.casestudy.module2_accountname_wbe.model.employee;

public class EducationDegree {
    private int id;
    private String educationDegree;

    public EducationDegree(int id, String educationDegree) {
        this.id = id;
        this.educationDegree = educationDegree;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEducationDegree() {
        return educationDegree;
    }

    public void setEducationDegree(String educationDegree) {
        this.educationDegree = educationDegree;
    }
}
