//
//  MovieListView.swift
//  Xplor Movies
//
//  Created by Jiten Goswami on 04/08/23.
//

import SwiftUI

struct MovieListView: View {
    
    // MARK: Variable declarations
    @StateObject private var movieVM = MovieVM()
    @StateObject private var networkMonitor = NetworkMonitor()
    
    @State private var searchMovieName = ""
    
    // MARK: View body
    var body: some View {
        
        ZStack{
            NavigationView{
                Form{
                    HStack{
                        Image(systemName: networkMonitor.isConnected ? "wifi" : "wifi.slash")
                        Text(networkMonitor.isConnected ? "Internet available" : "Internet not available")
                        Spacer()
                        if movieVM.inProgress {
                            ProgressView()
                                .frame(width: 20, height: 20)
                        }
                    }
                    
                    SearchBar(placeholder: "Enter movie name here..", text: $searchMovieName)
                        .disableAutocorrection(true)
                        .onChange(of: searchMovieName){ _ in
                            if networkMonitor.isConnected{
                                movieVM.getMovieListBySearch(strMovieName: searchMovieName)
                            }
                        }
                    
                    List(movieVM.arrMovieList){ movie in
                        MovieCell(movie: movie)
                    }
                    
                }
                .navigationBarTitle(Constants.NavigationTitles.ntMovieList)
            }
            .onAppear(){
                networkMonitor.start()
            }
            .onDisappear(){
                networkMonitor.stop()
            }
        }
        
        .alert(isPresented: $movieVM.isMovieNotFound) {
            Alert(title: Text("Alert!"),
                  message: Text(Constants.AlertStrings.alertMovieNotFound),
                  dismissButton: .default(Text("Dismiss")))
        }
    }
}

struct SearchBar: View {
    var placeholder: String
    
    @Binding var text: String
    
    var body: some View {
        HStack{
            TextField(placeholder, text: $text)
            if text != "" {
                Image(systemName: "xmark.circle.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color(.systemGray3))
                    .padding(3)
                    .onTapGesture {
                        withAnimation {
                            self.text = ""
                        }
                    }
            }
        }.padding(20)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
