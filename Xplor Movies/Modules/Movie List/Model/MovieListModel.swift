//
//  MovieListModel.swift
//  Xplor Movies
//
//  Created by Jiten Goswami on 04/08/23.
//

import Foundation

struct MovieListModel: Decodable {
    var results: [MovieItemModelData]
}

struct MovieItemModelData: Decodable, Identifiable {
    let id = UUID()
    var title: String
    var overview: String
    var posterPath: String? // Optional as for some movies poster path is not available
    
    enum CodingKeys: String, CodingKey {
        case title, overview
        case posterPath = "poster_path"
    }
}
