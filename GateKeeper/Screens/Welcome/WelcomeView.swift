//
//  WelcomeView.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import UIKit

class WelcomeView: UIView {
    
    private let presenter: WelcomePresenter

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        return button
    }()

    private let margin: CGFloat = 8
    
    init(presenter: WelcomePresenter) {
        self.presenter = presenter
        
        super.init(frame: .zero)

        backgroundColor = .white
        
        logoutButton.addTarget(self, action: #selector(tapOnLogout), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, logoutButton])
        stackView.spacing = margin
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tapOnLogout() {
        presenter.logout()
    }
}

