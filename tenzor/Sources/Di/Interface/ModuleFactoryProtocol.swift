//
//  ModuleFactoryProtocol.swift
//  tenzor
//
//  Created by user on 10/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

protocol ModuleFactoryProtocol {
    func makeFeedModule() -> FeedController
    func makeDetailModule(movieId: Int) -> DetailsController
}
