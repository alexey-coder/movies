//
//  FeedView.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

protocol DetailsViewProtocol: class {
    func displayScreenTitle(title: String)
    func closePressed()
    func refreshDetailsView()
    func displayMoviesRetrievalError(title: String, message: String)
}
