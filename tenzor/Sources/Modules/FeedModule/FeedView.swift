//
//  FeedView.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import UIKit

class FeedView: UIView {

    let tableFeed: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = ColorService.backgroundColor
        table.tableFooterView = UIView.init(frame: .zero)
        table.register(FeedTableCell.self, forCellReuseIdentifier: String(describing: FeedTableCell.self))
        table.estimatedRowHeight = 60
        table.rowHeight = UITableView.automaticDimension
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorService.backgroundColor
        addSubview(tableFeed)
        NSLayoutConstraint.activate([
            tableFeed.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableFeed.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tableFeed.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableFeed.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
