package com.example.conectapp.view;

import android.os.Bundle;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.conectapp.R;
import com.example.conectapp.model.UserRepository;
import com.example.conectapp.presenter.UserPresenter;

public class LoginActivity extends AppCompatActivity implements UserView{

    private TextView nameTextView;
    private TextView emailTextView;
    private UserPresenter presenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_login);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        nameTextView = findViewById(R.id.nameTextView);
        emailTextView = findViewById(R.id.emailTextView);

        presenter = new UserPresenter(this, new UserRepository());
        presenter.loadUser();
    }

    @Override
    public void showUserName(String name) {
        nameTextView.setText(name);
    }

    @Override
    public void showUserEmail(String email) {
        emailTextView.setText(email);
    }
}