//
//  DetailsRouterProtocol.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

protocol DetailsRouterProtocol: class {
    func dismissView()
    var moduleFactory: ModuleFactoryProtocol { get }
}
