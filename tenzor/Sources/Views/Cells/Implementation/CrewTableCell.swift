//
//  CrewTableCell.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import UIKit

class CrewTableCell: UITableViewCell {
    
    let jobLabel: UILabel = {
        let label = UILabel()
        label.font = FontsService.Bold.of(size: 18)
        label.textColor = ColorService.textColor
        label.text = "Job:"
        return label
    }()
    
    let jobActorLabel: UILabel = {
        let label = UILabel()
        label.font = FontsService.Bold.of(size: 16)
        label.textColor = ColorService.descriptionColor
        label.numberOfLines = 0
        return label
    }()
    
    lazy var jobStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [jobLabel, jobActorLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        return stack
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = FontsService.Bold.of(size: 18)
        label.textColor = ColorService.textColor
        label.text = "Name:"
        return label
    }()
    
    let nameActorLabel: UILabel = {
        let label = UILabel()
        label.font = FontsService.Bold.of(size: 16)
        label.textColor = ColorService.descriptionColor
        label.numberOfLines = 0
        return label
    }()
    
    lazy var nameStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, nameActorLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        return stack
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [jobStack, nameStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(stackView)
        selectionStyle = .none
        backgroundColor = ColorService.backgroundColor
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CrewTableCell: CrewTableCellProtocol {
    func display(job: String) {
        jobActorLabel.text = job
    }
    
    func display(name: String) {
        nameActorLabel.text = name
    }
}
