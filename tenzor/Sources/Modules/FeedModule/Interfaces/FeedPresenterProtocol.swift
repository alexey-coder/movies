//
//  FeedPresenter.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

protocol FeedPresenterProtocol: class {
    var numberOfMovies: Int { get }
    var router: FeedRouterProtocol { get }
    func viewDidLoad()
    func configure(cell: FeedTableCellProtocol, forRow row: Int)
    func didSelect(row: Int)
}
