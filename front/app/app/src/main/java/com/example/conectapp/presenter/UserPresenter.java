package com.example.conectapp.presenter;

import com.example.conectapp.model.UserModel;
import com.example.conectapp.model.UserRepository;
import com.example.conectapp.view.UserView;

public class UserPresenter {
    private UserView view;
    private UserRepository repository;

    public UserPresenter(UserView view, UserRepository repository) {
        this.view = view;
        this.repository = repository;
    }

    public void loadUser() {
        UserModel user = repository.getUser();
        if (user != null) {
            view.showUserName(user.getName());
            view.showUserEmail(user.getEmail());
        }
    }
}
