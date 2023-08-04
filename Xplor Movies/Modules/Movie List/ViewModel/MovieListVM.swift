//
//  MovieListVM.swift
//  Xplor Movies
//
//  Created by Jiten Goswami on 04/08/23.
//

import SwiftUI

final class MovieVM: ObservableObject {
    @Published var arrMovieList: [MovieItemModelData] = [MovieItemModelData]()
    @Published var isMovieNotFound = false
    @Published var inProgress = false
    
    func getMovieListBySearch(strMovieName: String){
        inProgress = true
        
        let strUrl = "\(Constants.ApiDetails.apiSearch)\(strMovieName)"
        
        if strMovieName != "" {
            
            ApiManager.getApiCall(apiUrl: strUrl) { result in
                DispatchQueue.main.async {
                    self.inProgress = false
                    
                    switch result{
                    case .success(let data):
                        do{
                            let decoder = JSONDecoder()
                            let jsonData = try decoder.decode(MovieListModel.self, from: data)
                            if jsonData.results.isEmpty{
                                if !self.arrMovieList.isEmpty{
                                    self.arrMovieList.removeAll()
                                }
                                self.isMovieNotFound = true
                            }else{
                                self.arrMovieList.removeAll()
                                for movie in jsonData.results {
                                    self.arrMovieList.append(movie)
                                }
                            }
                        }catch{
                            print(Constants.AlertStrings.alertInvalidDataMessage)
                        }
                    case .failure(let error):
                        switch error {
                        case .invalidURL:
                            print(Constants.AlertStrings.alertInvalidUrlMessage)
                        case .invalidResponse:
                            print(Constants.AlertStrings.alertInvalidResponseMessage)
                        case .unableToComplete:
                            print(Constants.AlertStrings.alertUnableToCompleteMessage)
                        case .invalidData:
                            print(Constants.AlertStrings.alertInvalidDataMessage)
                        }
                    }
                }
            }
        }else{
            self.inProgress = false
            if !self.arrMovieList.isEmpty{
                self.arrMovieList.removeAll()
            }
        }
    }
}
