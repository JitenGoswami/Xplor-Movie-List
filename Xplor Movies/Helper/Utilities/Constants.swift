//
//  Constants.swift
//  Xplor Movies
//
//  Created by Jiten Goswami on 04/08/23.
//

import Foundation

struct Constants{
    
    // MARK: Api details
    struct ApiDetails{
        static let apiBaseURL = "https://api.themoviedb.org/3/"
        static let apiToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmM2E2ODdmZGY5NDhjZDNjMjBjZWNiZmQ3ZGU4MTA3MCIsInN1YiI6IjY0YzNmNmRiZDg2MWFmMDBhY2E4NGJhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XQo5MBNPfkmh0rHhCouXq1R-8Bx8koDmxboHaXMn2_I"
        
        // Api end points
        static let apiSearch = apiBaseURL + "search/movie?query="
        
        // Image url
        static let imageBaseURL = "https://image.tmdb.org/t/p/w154"
    }
    
    // MARK: Navigation titles
    struct NavigationTitles{
        static let ntMovieList = "Movie List"
    }
    
    // MARK: Alert strings/text
    struct AlertStrings{
        
        // Invalid Url
        static let alertInvalidUrlMessage = "Something is wrong in Api Url."
        
        // Unable to complete
        static let alertUnableToCompleteMessage = "Unable to complete the request. Try again."
        
        // Invalid response
        static let alertInvalidResponseMessage = "Invalid response. Something went wrong."
        
        // Invalid data
        static let alertInvalidDataMessage = "Invalid data received from server."
        
        // Movie not found
        static let alertMovieNotFound = "Movie not found. Try entering some other movie names in search."
    }
}
