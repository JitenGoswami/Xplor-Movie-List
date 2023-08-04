//
//  ApiManager.swift
//  Xplor Movies
//
//  Created by Jiten Goswami on 04/08/23.
//

import Foundation

struct ApiManager{
    
    // MARK: Api error enum
    enum ApiErrors: Error{
        case invalidURL
        case unableToComplete
        case invalidResponse
        case invalidData
    }
    
    // MARK: Api methods
    static func getApiCall(apiUrl: String, completionHander: @escaping (Result<Data, ApiErrors>) -> Void){
        
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer \(Constants.ApiDetails.apiToken)"
        ]
        
        
        guard let url = URL(string: apiUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
            completionHander(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let _ = error{
                completionHander(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHander(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completionHander(.failure(.invalidData))
                return
            }
            
            completionHander(.success(data))
        }
        
        dataTask.resume()
    }
}
