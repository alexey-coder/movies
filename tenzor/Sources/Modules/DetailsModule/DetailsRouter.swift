//
//  DetailsRouter.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

class DetailsRouter {
    fileprivate weak var deatilsController: DetailsController?
    var moduleFactory: ModuleFactoryProtocol
    
    init(moduleFactory: ModuleFactoryProtocol) {
        self.moduleFactory = moduleFactory
    }
}

extension DetailsRouter: DetailsRouterProtocol {
    func dismissView() {
        self.deatilsController?.dismiss(animated: true, completion: nil)
    }
}
