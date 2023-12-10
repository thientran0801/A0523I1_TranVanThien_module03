package com.casestudy.module2_accountname_wbe.model.employee;

public class User_Role {
    private User user;
    private Role role;

    public User_Role(User user, Role role) {
        this.user = user;
        this.role = role;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
