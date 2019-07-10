//
//  MovieModel.swift
//  tenzor
//
//  Created by user on 09/07/2019.
//  Copyright © 2019 smirnov. All rights reserved.
//

import Foundation

public struct MoviesResponseModel: Codable {
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [MovieModel]
}

public struct MovieModel: Codable {
    public let id: Int
    public let title: String
    public let backdropPath: String
    public let posterPath: String
    public let overview: String
    public let releaseDate: Date
    public let voteAverage: Double
    public let voteCount: Int
    public let tagline: String?
    public let genres: [MovieGenre]?
    public let credits: MovieCreditResponse?
    public let adult: Bool
    public let runtime: Int?
    public var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")!
    }
    
    public var voteAveragePercentText: String {
        return "\(Int(voteAverage * 10))%"
    }
}

public struct MovieGenre: Codable {
    let name: String
}

public struct MovieCreditResponse: Codable {
    public let id: Int
    public let crew: [MovieCrew]
}

public struct MovieCrew: Codable {
    public let id: Int
    public let department: String
    public let job: String
    public let name: String
}
