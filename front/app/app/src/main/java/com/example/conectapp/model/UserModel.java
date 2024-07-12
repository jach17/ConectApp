package com.example.conectapp.model;

public class UserModel {
    private String name;
    private String email;

    // Constructor, getters y setters
    public UserModel(String name, String email) {
        this.name = name;
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }
}
