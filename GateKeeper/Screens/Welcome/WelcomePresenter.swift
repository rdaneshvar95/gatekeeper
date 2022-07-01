//
//  WelcomePresenter.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import Foundation

class WelcomePresenter {
    
    weak var viewControllerDelegate: WelcomeViewControllerDelegate?
    weak var viewDelegate: WelcomeViewDelegate?
 
    func getRandomMedia() {
        let completion: ((Result<GiphyModel, Error>) -> ()) = { [weak self] result in
            switch result {
            case let .success(giphy):
                self?.viewDelegate?.showGiphy(giphy)
            case .failure:
                break
            }
        }

        GiphyService().getRandom(completion: completion)
    }

    func logout() {
        viewControllerDelegate?.showMainScreen()
    }
}

