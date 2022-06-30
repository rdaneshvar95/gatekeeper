//
//  WelcomeViewController.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import UIKit

protocol WelcomeViewControllerDelegate: AnyObject {
    func showMainScreen()
}

class WelcomeViewController: UIViewController {

    private let presenter = WelcomePresenter()

    override func loadView() {
        presenter.viewControllerDelegate = self

        view = WelcomeView(presenter: presenter)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WelcomeViewController: WelcomeViewControllerDelegate {
    func showMainScreen() {
        let mainViewController = MainViewController()
        navigationController?.setViewControllers([mainViewController], animated: true)
    }
}
