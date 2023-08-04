//
//  MovieCell.swift
//  Xplor Movies
//
//  Created by Jiten Goswami on 04/08/23.
//

import SwiftUI
import Kingfisher

struct MovieCell: View {
    
    var movie: MovieItemModelData
    
    var body: some View {
        HStack{
            if let posterUrl = movie.posterPath{
                KFImage.url(URL(string: "\(Constants.ApiDetails.imageBaseURL)\(posterUrl)"))
                    .placeholder( { Image("movie_placeholder") } )
                    .fade(duration: 0.25)
                    .resizable()
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            
            Spacer(minLength: 15)
            VStack(alignment: .leading){
                
                Text("Movie Name:")
                    .foregroundColor(.gray)
                
                Text(movie.title)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                    
                Text("Overview:")
                    .foregroundColor(.gray)
                
                Text(movie.overview)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }
        }
        .padding(5)
    }
}
