//
//  MainPresenter.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import Foundation

class MainPresenter {
    
    weak var viewControllerDelegate: MainViewControllerDelegate?
    
    func login() {
        viewControllerDelegate?.showWelcomeScreen()
    }
}
