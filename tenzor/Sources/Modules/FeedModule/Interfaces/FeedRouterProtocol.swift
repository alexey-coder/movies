//
//  FeedRouterProtocol.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

protocol FeedRouterProtocol: class {
    func presentDetailsView(for movie: MovieModel)
    var moduleFactory: ModuleFactoryProtocol { get }
}
