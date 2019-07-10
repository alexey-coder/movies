//
//  ApiService.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

protocol ApiServiceProtocol {
    func fetchMovies(from endpoint: Endpoint, params: [String: String]?, successHandler: @escaping (_ response: MoviesResponseModel) -> Void, errorHandler: @escaping(_ error: Error) -> Void)
    func fetchMovieCredits(id: Int, successHandler: @escaping (_ response: MovieCreditResponse) -> Void, errorHandler: @escaping(_ error: Error) -> Void)
}
