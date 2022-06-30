//
//  WelcomePresenter.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import Foundation

class WelcomePresenter {
    
    weak var viewControllerDelegate: WelcomeViewControllerDelegate?
    
    func login() {
        viewControllerDelegate?.showMainScreen()
    }
}

