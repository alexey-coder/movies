//
//  DetailsPresenterProtocol.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import UIKit

protocol DetailsPresenterProtocol: class {
    var router: DetailsRouterProtocol { get }
    func viewDidLoad()
    func close()
    var numberOfCrew: Int { get }
    func configure(cell: CrewTableCellProtocol, forRow row: Int)
}
