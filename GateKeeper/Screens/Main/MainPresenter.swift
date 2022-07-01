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
    
    var errorMessage: String {
        switch self {
        case .emptyUsername:
            return "It looks like you forgot to provide a username."
        case .wrongPassword:
            return "The password you provided does not match our records."
        }
    }
}

class MainPresenter {
    
    weak var viewControllerDelegate: MainViewControllerDelegate?
    
    let validPassword = "password"
    
    func login(username: String?, password: String?) {
        do {
            let username = try validate(username: username, password: password)
            viewControllerDelegate?.showWelcomeScreen(name: username)
        } catch {
            guard let error = error as? LoginError else {
                preconditionFailure("Unexpected error")
            }
            viewControllerDelegate?.showErrorAlert(message: error.errorMessage)
        }
    }
    
    func validate(username: String?, password: String?) throws -> String {
        guard let username = username, !username.isEmpty else {
            throw LoginError.emptyUsername
        }
        
        guard let password = password, password == validPassword else {
            throw LoginError.wrongPassword
        }
        
        return username
    }
}
