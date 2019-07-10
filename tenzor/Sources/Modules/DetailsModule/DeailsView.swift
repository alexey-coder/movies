//
//  DeailsView.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import UIKit

class DetailsView: UIView {
    
    let activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.style = .gray
        ai.hidesWhenStopped = true
        return ai
    }()
    
    let detailTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CrewTableCell.self, forCellReuseIdentifier: String(describing: CrewTableCell.self))
        table.estimatedRowHeight = 64
        table.rowHeight = UITableView.automaticDimension
        table.backgroundColor = ColorService.backgroundColor
        table.tableFooterView = UIView.init(frame: .zero)
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorService.backgroundColor
        [activityIndicator, detailTable].forEach { addSubview($0) }
        NSLayoutConstraint.activate([
            activityIndicator.widthAnchor.constraint(equalToConstant: 40),
            activityIndicator.heightAnchor.constraint(equalToConstant: 40),
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            detailTable.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            detailTable.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            detailTable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailTable.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
