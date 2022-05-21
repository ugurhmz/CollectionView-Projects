//
//  MVVM-RRoute.swift
//  05- CompositionalLayout-Foody
//
//  Created by ugur-pc on 4.05.2022.
//

protocol MVVM-RRoute {
    func presentMVVM-R()
}

extension MVVM-RRoute where Self: RouterProtocol {
    
    func presentMVVM-R() {
        let router = MVVM-RRouter()
        let viewModel = MVVM-RViewModel(router: router)
        let viewController = MVVM-RViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
