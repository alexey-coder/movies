//
//  FeedTableCell.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import UIKit

class FeedTableCell: UITableViewCell {
    
    let movieImage: CustomImageView = {
        let image = CustomImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = FontsService.Bold.of(size: 18)
        label.textColor = ColorService.textColor
        label.numberOfLines = 0
        return label
    }()
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.font = FontsService.Bold.of(size: 18)
        label.textColor = ColorService.textColor
        label.text = "Rate:"
        return label
    }()
    
    let movieRateLabel: UILabel = {
        let label = UILabel()
        label.font = FontsService.Bold.of(size: 16)
        label.textColor = ColorService.descriptionColor
        return label
    }()
    
    lazy var rateStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [rateLabel, movieRateLabel])
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [movieNameLabel, rateStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = ColorService.backgroundColor
        selectionStyle = .none
        [movieImage, stackView].forEach { addSubview($0) }
        NSLayoutConstraint.activate([
            movieImage.heightAnchor.constraint(equalToConstant: 48),
            movieImage.widthAnchor.constraint(equalToConstant: 48),
            movieImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            movieImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FeedTableCell: FeedTableCellProtocol {
    func display(title: String) {
        movieNameLabel.text = title
    }
    
    func display(image: URL) {
        movieImage.downloadImageFrom(url: image, imageMode: .scaleAspectFit)
    }
    
    func display(rate: String) {
        movieRateLabel.text = rate
    }
}
