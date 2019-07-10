//
//  DetailsPresenter.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

class DetailsPresenter {
    fileprivate let movieId: Int
    var moviewCrew = [MovieCrew]()
    var movieName: String
    let router: DetailsRouterProtocol
    fileprivate weak var view: DetailsViewProtocol?
    fileprivate let apiService: ApiServiceProtocol?
    
    init(view: DetailsViewProtocol, movieId: Int, movieName: String, router: DetailsRouterProtocol, apiService: ApiServiceProtocol) {
        self.view = view
        self.movieId = movieId
        self.router = router
        self.apiService = apiService
        self.movieName = movieName
    }
}

extension DetailsPresenter : DetailsPresenterProtocol {
    
    var numberOfCrew: Int {
        return self.moviewCrew.count
    }
    
    func configure(cell: CrewTableCellProtocol, forRow row: Int) {
        let crew = moviewCrew[row]
        cell.display(job: crew.job)
        cell.display(name: crew.name)
    }
    
    func close() {
        router.dismissView()
    }
    
    func viewDidLoad() {
        view?.displayScreenTitle(title: self.movieName)
        apiService?.fetchMovieCredits(id: self.movieId, successHandler: { response in
            self.moviewCrew = response.crew
            self.view?.refreshDetailsView()
        }, errorHandler: { error in
            self.view?.displayMoviesRetrievalError(title: "Error", message: error.localizedDescription)
        })
    }
}
