//
//  WelcomeView.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import SDWebImage
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
    
    private let imageView: SDAnimatedImageView = {
        let imageView = SDAnimatedImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.large
        return imageView
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
            titleLabel, imageView, authorLabel, welcomeLabel, logoutButton
        ])
        stackView.spacing = margin
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
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
        imageView.sd_setImage(with: URL(string: model.url))
        authorLabel.text = model.author
    }
}
