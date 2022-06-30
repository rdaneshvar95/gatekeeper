//
//  MainViewController.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func showWelcomeScreen()
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
    func showWelcomeScreen() {
        let welcomeViewController = WelcomeViewController()
        navigationController?.setViewControllers([welcomeViewController], animated: true)
    }
}
