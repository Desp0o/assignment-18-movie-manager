//
//  Movie_Model.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

struct Movie_Model {
    let poster: String
    let backDrop: String
    let title: String
    let imdb: Double
    let description: String
    let cast: [Actor_Model]
    let duration: String
    let language: String
    let rating: String
    let genres: [String]
    var isFaved: Bool
    var isPopular: Bool
}
