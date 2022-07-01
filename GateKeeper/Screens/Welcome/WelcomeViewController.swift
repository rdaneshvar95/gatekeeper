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

    private let name: String

    init(name: String) {
        self.name = name

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = WelcomeView(presenter: presenter, name: name)

        presenter.viewDelegate = view
        presenter.viewControllerDelegate = self

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getRandomMedia()
    }
}

extension WelcomeViewController: WelcomeViewControllerDelegate {
    func showMainScreen() {
        let mainViewController = MainViewController()
        navigationController?.setViewControllers([mainViewController], animated: true)
    }
}
