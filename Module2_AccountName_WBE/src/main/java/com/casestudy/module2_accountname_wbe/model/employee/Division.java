package com.casestudy.module2_accountname_wbe.model.employee;

public class Division {
    private int id;
    private String division;

    public Division(int id, String division) {
        this.id = id;
        this.division = division;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }
}
