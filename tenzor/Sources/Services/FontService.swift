//
//  FontService.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import UIKit

enum FontsService: String {
    
    case Regular = "Roboto-Regular"
    case Medium  = "Roboto-Medium"
    case Bold    = "Roboto-Bold"

    func of(size: CGFloat) -> UIFont? {
        return UIFont(name: rawValue, size: size)
    }
}
