//
//  FeedTAbleCellProtocol.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

protocol FeedTableCellProtocol: class {
    func display(title: String)
    func display(image: URL)
    func display(rate: String)
}
