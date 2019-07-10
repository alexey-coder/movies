//
//  DetailsController.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import UIKit

class DetailsController: BaseController<DetailsView> {
    var presenter: DetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        ui.detailTable.delegate = self
        ui.detailTable.dataSource = self
    }
}

extension DetailsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfCrew
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CrewTableCell = tableView.dequeueReusableCell(for: indexPath)
        presenter.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
}

extension DetailsController: UITableViewDelegate {}

extension DetailsController: DetailsViewProtocol {
    func displayMoviesRetrievalError(title: String, message: String) {
        DispatchQueue.main.async {
            self.showAlertMessageWithTitle(title: title, message: message)
        }
    }
    
    func refreshDetailsView() {
        DispatchQueue.main.async {
            self.ui.detailTable.reloadData()
        }
    }
    
    func closePressed() {
        presenter.close()
    }
    
    func displayScreenTitle(title: String) {
        
    }
}
