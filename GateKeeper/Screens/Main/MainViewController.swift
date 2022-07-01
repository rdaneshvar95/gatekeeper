//
//  MainViewController.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func showWelcomeScreen(name: String)
    func showErrorAlert(message: String)
}

class MainViewController: UIViewController {

    private let presenter = MainPresenter()

    override func loadView() {
        presenter.viewControllerDelegate = self

        view = MainView(presenter: presenter)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController: MainViewControllerDelegate {
    func showErrorAlert(message: String) {
        let alertViewController = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alertViewController.addAction(.init(title: "OK", style: .default, handler: { _ in
            alertViewController.dismiss(animated: true)
        }))
        present(alertViewController, animated: true)
    }
    
    func showWelcomeScreen(name: String) {
        let welcomeViewController = WelcomeViewController(name: name)
        navigationController?.setViewControllers([welcomeViewController], animated: true)
    }
}
