//
//  MainPresenter.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import Foundation

enum LoginError: Error {
    case emptyUsername
    case wrongPassword
}

class MainPresenter {
    
    weak var viewControllerDelegate: MainViewControllerDelegate?
    
    func login(username: String?, password: String?) {
        do {
            try validate(username: username, password: password)
            viewControllerDelegate?.showWelcomeScreen()
        } catch LoginError.emptyUsername {
            viewControllerDelegate?.showErrorAlert(message: "It looks like you forgot to provide a username.")
        } catch LoginError.wrongPassword {
            viewControllerDelegate?.showErrorAlert(message: "The password you provided does not match our records.")
        } catch {
            preconditionFailure("Unexpected error")
        }
    }
    
    func validate(username: String?, password: String?) throws {
        guard let username = username, !username.isEmpty else {
            throw LoginError.emptyUsername
        }
        
        guard let password = password, password == "password" else {
            throw LoginError.wrongPassword
        }
    }
}
