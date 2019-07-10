//
//  FeedPresenter.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

class FeedPresenter: FeedPresenterProtocol {
    
    fileprivate weak var view: FeedViewProtocol?
    let router: FeedRouterProtocol
    fileprivate let apiService: ApiServiceProtocol?
    
    init(view: FeedViewProtocol, router: FeedRouterProtocol, apiService: ApiServiceProtocol?) {
        self.view = view
        self.router = router
        self.apiService = apiService
    }
    
    var movies = [MovieModel]()
    
    var numberOfMovies: Int {
        return self.movies.count
    }
    
    func viewDidLoad() {
        view?.showLoading()
        apiService?.fetchMovies(from: .topRated, params: nil, successHandler: { response in
            self.movies = response.results
            self.view?.hideLoading()
            self.view?.refreshMoviesView()
        }, errorHandler: { error in
            self.view?.hideLoading()
            self.view?.displayMoviesRetrievalError(title: "Error", message: error.localizedDescription)
        })
    }
    
    func configure(cell: FeedTableCellProtocol, forRow row: Int) {
        let movie = movies[row]
        cell.display(title: movie.title)
        cell.display(rate: movie.voteAveragePercentText)
        cell.display(image: movie.posterURL)
    }
    
    func didSelect(row: Int) {
        let movie = movies[row]
        router.presentDetailsView(for: movie)
    }
}
