//
//  MainView.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import UIKit

class MainView: UIView {
    
    private enum Copy: String {
        case username = "Username"
        case password = "Password"
        case login = "Login"
        case forgotPassword = "Forgot Password"
    }

    private let presenter: MainPresenter

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = Copy.username.rawValue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.clearButtonMode = .whileEditing
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = Copy.password.rawValue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Copy.login.rawValue, for: .normal)
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.isEnabled = false
        button.setTitle(Copy.forgotPassword.rawValue, for: .normal)
        return button
    }()

    private let margin: CGFloat = 8
    
    init(presenter: MainPresenter) {
        self.presenter = presenter

        super.init(frame: .zero)
        
        backgroundColor = .white
        
        loginButton.addTarget(self, action: #selector(tapOnLogin), for: .touchUpInside)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [forgotPasswordButton, loginButton])
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually

        addSubview(usernameLabel)
        addSubview(usernameTextField)
        
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        
        addSubview(buttonsStackView)

        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            usernameTextField.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: margin),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            
            usernameTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameLabel.centerYAnchor.constraint(equalTo: usernameTextField.centerYAnchor),
            
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: margin),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: margin),
            passwordLabel.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            
            usernameTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
            buttonsStackView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: margin),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tapOnLogin() {
        presenter.login(username: usernameTextField.text, password: passwordTextField.text)
    }
}
