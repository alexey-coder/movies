//
//  FeedView.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

protocol FeedViewProtocol: class {
    func refreshMoviesView()
    func displayMoviesRetrievalError(title: String, message: String)
}
