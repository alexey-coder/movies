//
//  FeedView.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import UIKit

class FeedView: UIView {
    
    let activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.style = .gray
        ai.hidesWhenStopped = true
        return ai
    }()

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
        [activityIndicator, tableFeed].forEach { addSubview($0) }
        NSLayoutConstraint.activate([
            activityIndicator.widthAnchor.constraint(equalToConstant: 40),
            activityIndicator.heightAnchor.constraint(equalToConstant: 40),
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
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
