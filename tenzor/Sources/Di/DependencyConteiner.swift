//
//  ModuleFactory.swift
//  tenzor
//
//  Created by user on 10/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

class ModuleDependencyContainer {
    private lazy var apiService = ApiService.shared
}

extension ModuleDependencyContainer: ModuleFactoryProtocol {
    
     func makeFeedModule() -> FeedController {
        let feedController = FeedController()
        let router = FeedRouter(feedController: feedController, moduleFactory: self)
        let presenter = FeedPresenter(view: feedController, router: router, apiService: self.apiService )
        feedController.presenter = presenter
        return feedController
    }
    
    func makeDetailModule(movieId: Int, movieName: String) -> DetailsController {
        let detailController = DetailsController()
        let router = DetailsRouter(moduleFactory: self)
        let presenter = DetailsPresenter(view: detailController, movieId: movieId, movieName: movieName, router: router, apiService: self.apiService)
        detailController.presenter = presenter
        return detailController
    }
}
