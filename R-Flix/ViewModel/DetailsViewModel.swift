//
//  DetailsViewModel.swift
//  OpenFlix
//
//  Created by Mr Producer on 03/12/2023.
//

import SwiftUI


@MainActor
class DetailViewModel: ObservableObject {
    
    @Published var credits: MovieCredits?
    @Published var cast: [Cast] = []
    @Published var castProfiles: [CastProfile] = []

    
    //same for wathcing the movie
    func findTheMovieCredits(for movieID: Int){
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(MovieTrendingViewModel.apiKey)&language=en-US")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let credits = try JSONDecoder().decode(MovieCredits.self ,from: data)
                self.credits = credits
                self.cast = credits.cast.sorted(by: { $0.order < $1.order })
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func loadCastImages() {
        
        Task {
            for person in cast {
                let url = URL(string: "https://api.themoviedb.org/3/person/\(person.id)?api_key=\(MovieTrendingViewModel.apiKey)&language=en-US")!
                do {
                    let (data,_) = try await URLSession.shared.data(from: url)
                    let profile = try JSONDecoder().decode(CastProfile.self, from: data)
                    castProfiles.append(profile)
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct MovieCredits: Codable, Identifiable {
    let id: Int
    let cast: [Cast]
    
}

struct Cast: Identifiable, Codable {
    let name: String
    let id: Int
    let character: String
    let order: Int
}


struct CastProfile: Codable, Identifiable {
    
    let birthday: String?
    let id: Int
    let name: String
    let profile_path: String?
    
    var photoURL: URL? {
       let baseURL = URL(string: "https://image.tmdb.org/t/p/w200")!
       return baseURL.appending(path: profile_path ?? "")
    }
}
