//
//  WelcomeView.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import UIKit

protocol WelcomeViewDelegate: AnyObject {
    func showGiphy(_: GiphyModel)
}

class WelcomeView: UIView {
    
    private enum Copy: String {
        case logout = "Logout"
        case welcome = "Welcome %@"
    }

    private let presenter: WelcomePresenter

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Copy.logout.rawValue, for: .normal)
        return button
    }()

    private let margin: CGFloat = 8
    
    init(presenter: WelcomePresenter, name: String) {
        self.presenter = presenter
        
        super.init(frame: .zero)

        backgroundColor = .white
        
        welcomeLabel.text = .localizedStringWithFormat(Copy.welcome.rawValue, name)
        logoutButton.addTarget(self, action: #selector(tapOnLogout), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [
            welcomeLabel, logoutButton, authorLabel, titleLabel
        ])
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

extension WelcomeView: WelcomeViewDelegate {
    func showGiphy(_ model: GiphyModel) {
        titleLabel.text = model.title
        authorLabel.text = model.author
    }
}
