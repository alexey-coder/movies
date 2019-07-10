//
//  FeedRouter.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import UIKit

class FeedRouter: FeedRouterProtocol {
    
    fileprivate weak var feedController: FeedController?
    fileprivate var movie: MovieModel!
    var moduleFactory: ModuleFactoryProtocol
    
    init(feedController: FeedController, moduleFactory: ModuleFactoryProtocol) {
        self.feedController = feedController
        self.moduleFactory = moduleFactory
    }
    
    func presentDetailsView(for movie: MovieModel) {
        self.movie = movie
        let detailsController = moduleFactory.makeDetailModule(movieId: movie.id)
        feedController?.navigationController?.pushViewController(detailsController, animated: true)
    }
}
