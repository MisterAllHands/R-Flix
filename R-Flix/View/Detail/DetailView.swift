//
//  DetailView.swift
//  R-Flix
//
//  Created by Mr Producer on 07/12/2023.
//

import SwiftUI
import AVKit

//struct DetailView: View {
//    
//    let movie: CombinedMovie
//    @Environment(\.presentationMode) var presentationMode
//            
//    var body: some View{
//        VStack {
//            VStack {
//                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
//                    
//                    ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
//                        AsyncImage(url: movie.poster) { phase in
//                                switch phase {
//                                case .empty:
//                                    Color(.gray)
//                                        .frame(height: 280)
//                                case .success(let image):
//                                    image
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
//
//                                        .frame(height: UIScreen.main.bounds.height / 3)
//                                        .overlay {
//                                            LinearGradient(colors: [
//                                                Color.black.opacity(0.9),
//                                                Color.black.opacity(0.4),
//                                                Color.black.opacity(0.1),
//                                                Color.black.opacity(0.01),
//
//                                            ], startPoint: .bottom, endPoint: .top)
//                                        }
//                                case .failure(let error):
//                                    Text("Failed to load image: \(error.localizedDescription)")
//                                @unknown default:
//                                    fatalError()
//                                }
//                        }
//                        
//                        VStack(spacing: 5) {
//                            HStack(spacing: 0) {
//                                Text(movie.title)
//                                    .font(.title)
//                                    .fontWeight(.black)
//                                    .foregroundStyle(.white)
//                                    .padding()
//                                
//                                Text(movie.releaseDate ?? "")
//                                    .font(.system(size: 18).bold())
//                                    .foregroundStyle(.white.opacity(0.8))
//                                
//                                Spacer().frame(width: 160)
//                            }
//                            .padding(.leading)
//
//                            
//                            HStack(spacing: 15) {
//                                Text("1789 reviews")
//                                    .padding(.leading)
//                                Text("1h 44min")
//                                
//                                Spacer().frame(width: 200)
//
//                            }
//                            .padding(.leading, 20)
//                            .foregroundStyle(.white.opacity(0.8))
//                            .font(.system(size: 15,weight: .bold))
//                            
//                            HStack(spacing: 15){
//                                RoundedRectangle(cornerRadius: 25)
//                                    .fill(.ultraThinMaterial)
//                                    .frame(maxWidth: 80, maxHeight: 25)
//                                    .overlay {
//                                        Text("Action")
//                                            .font(.caption).bold()
//                                            .foregroundStyle(.white)
//                                    }
//                                RoundedRectangle(cornerRadius: 25)
//                                    .fill(.ultraThinMaterial)
//                                    .frame(width: 90, height: 25)
//                                    .overlay {
//                                        Text("Fantasy")
//                                            .font(.caption).bold()
//                                            .foregroundStyle(.white)
//                                    }
//                                
//                                Spacer().frame(width: 150)
//
//                            }
//                            .padding(.top)
//                        }
//                        .padding()
//                        
//                    }
//                    
//                    HStack {
//                        Button(action: {
//                            withAnimation(.spring()){
//                                presentationMode.wrappedValue.dismiss()
//                            }
//                        }){
//                          Image(systemName: "chevron.left")
//                                .font(.title2.bold())
//                                .foregroundStyle(.white)
//                                .padding()
//
//                        }
//                        
//                        Spacer()
//                        
//                        Button(action: {
//                            
//                        }){
//                          Image(systemName: "ellipsis")
//                                .font(.title2.bold())
//                                .foregroundStyle(.white)
//                                .padding()
//                        }
//                    }
//                    .padding(30)
//                    .padding(.horizontal, 30)
//                    
//                    
//                })
//                .ignoresSafeArea(.all)
//            }
//             Spacer(minLength: 0)
//            
//           
//
//            Spacer(minLength: 0)
//            
//        }
//        .background(Color.bg)
//    }
//}

struct DetailView: View {
    
    let movie: CombinedMovie
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            
            
            
        }
        .background(Color.bg)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View{
        DetailView(movie: CombinedMovie(title: "", imdbID: "", embedURLImdb: "", type: "", overview: "", voteAverage: 1, voteCount: 1, genreIDS: [], popularity: 1, originalLanguage: ""))
    }
}

