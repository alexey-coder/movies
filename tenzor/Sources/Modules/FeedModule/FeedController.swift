//
//  FeedController.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import UIKit

class FeedController: BaseController<FeedView> {
    var presenter: FeedPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        ui.tableFeed.dataSource = self
        ui.tableFeed.delegate = self
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationItem.title = "Feed"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: ColorService.textColor,
            NSAttributedString.Key.font: FontsService.Bold.of(size: 20)!
        ]
    }
}

extension FeedController: FeedViewProtocol {
    func showLoading() {
        DispatchQueue.main.async {
            self.ui.tableFeed.isHidden = true
            self.ui.activityIndicator.startAnimating()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.ui.tableFeed.isHidden = false
            self.ui.activityIndicator.stopAnimating()
        }
    }
    
    
    func refreshMoviesView() {
        DispatchQueue.main.async {
            self.ui.tableFeed.reloadData()
        }
    }
    
    func displayMoviesRetrievalError(title: String, message: String) {
        DispatchQueue.main.async {
            self.showAlertMessageWithTitle(title: title, message: message)
        }
    }
}

extension FeedController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
}

extension FeedController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfMovies
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FeedTableCell = tableView.dequeueReusableCell(for: indexPath)
        presenter.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
}
