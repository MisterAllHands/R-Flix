//
//  CastAndCrew.swift
//  OpenFlix
//
//  Created by Mr Producer on 03/12/2023.
//
import SwiftUI

struct CastView: View {
    
    let cast: CastProfile
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = DetailViewModel()
    
//    var size: CGSize
//    var safeArea: EdgeInsets
    
    var body: some View {
        VStack {
            AsyncImage(url: cast.photoURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 1600)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } placeholder: {
                ProgressView()
            }
            Text(cast.name)
                .font(.headline)
        }
//        ZStack {
//            
//            Color.black.ignoresSafeArea()
//            
//            ScrollView(.vertical, showsIndicators: false) {
//                VStack {
//                    ArtWork()
//                    
//                    GeometryReader{proxy in
//                        
//                        let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
//                        
//                        Button(action: {
//                            //Play the movie
//                        },label: {
//                            Text("PLAY")
//                                .font(.callout)
//                                .fontWeight(.bold)
//                                .foregroundStyle(.white)
//                                .padding(.horizontal, 45)
//                                .padding(.vertical, 12)
//                                .background {
//                                    Capsule()
//                                        .fill(LinearGradient(gradient: Gradient(colors: [ .mint,.cyan]), startPoint: .top, endPoint: .bottom))
//                                }
//                        })
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .offset(y: minY < 50 ? -(minY - 50) : 0)
//                    }
//                    .frame(height: 50)
//                    .padding(.top, -30)
//                    
//                    VStack(spacing: 0) {
//                        MovieDetails()
//                    }
//                    .foregroundStyle(.white)
//                    .padding(.top,10)
//                }
//                .overlay(alignment: .top) {
//                    HeaderView()
//                }
//            }
//            .coordinateSpace(name: "SCROLL")
//            .onAppear {
//                viewModel.findTheMovieCredits(for: movie.id)
//                viewModel.loadCastImages()
//            }
//        }
    }
    
//    @ViewBuilder
//    func ArtWork() -> some View {
//        let height = size.height * 0.45
//        GeometryReader{ proxy in
//            let size = proxy.size
//            let minY = proxy.frame(in: .named("SCROLL")).minY
//            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
//            
//            
//            AsyncImage(url: movie.backdropURL){ image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
//                    .clipped()
//                    .overlay(content: {
//                        ZStack(alignment: .bottom){
//                            Rectangle()
//                                .fill(
//                                    LinearGradient(colors: [
//                                        .black.opacity(0 - progress),
//                                        .black.opacity(0.1 - progress),
//                                        .black.opacity(0.3 - progress),
//                                        .black.opacity(0.5 - progress),
//                                        .black.opacity(0.8 - progress),
//                                        .black.opacity(1)
//                                    ], startPoint: .top, endPoint: .bottom)
//                                )
//                            VStack(spacing: 0){
//                                Text(movie.title)
//                                    .font(.system(size: 45))
//                                    .fontWeight(.bold)
//                                    .foregroundStyle(.white)
//                                    .multilineTextAlignment(.leading)
//                            }
//                            .opacity(1 + (progress > 0 ? -progress : progress))
//                            .padding(.bottom, 65)
//                            .offset(y: minY < 0 ? minY : 0)
//                        }
//                    })
//                    .offset(y: -minY)
//            } placeholder: {
//                ProgressView()
//            }
//            .frame(height: height + safeArea.top)
//        }
//    }
//        
//    @ViewBuilder
//    func MovieDetails() -> some View {
//        HStack {
//            Text("About Movie")
//                .font(.title3)
//                .fontWeight(.heavy)
//            Spacer()
//        }
//        .padding()
//        
//        Text(movie.overview)
//            .font(.callout)
//            .fontWeight(.medium)
//            .padding(10)
//        
//        HStack {
//            Text("Cast & Crew")
//                .font(.title3)
//                .fontWeight(.heavy)
//            Spacer()
//        }
//        .padding()
//        
//        Text(cast.name)
//            .font(.headline)
//            .fontWeight(.semibold)
//    }
//    
//    @ViewBuilder
//    func HeaderView() -> some View {
//        GeometryReader {proxy in
//            let minY = proxy.frame(in: .named("SCROLL")).minY
//            let height = size.height * 0.45
//            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
//            let titleProgress = minY / height
//
//            HStack(spacing: 15){
//                Button(action: {
//                    //Back
//                }, label: {
//                    Image(systemName: "chevron.left")
//                        .font(.title3)
//                        .foregroundStyle(.white)
//                    
//                })
//                
//                Spacer(minLength: 0)
//                
//                Button(action: {
//                    //favourties
//                }, label: {
//                    Image(systemName: "heart.fill")
//                        .font(.title2)
//                        .foregroundStyle(.red)
//                })
//                .opacity(1 + progress)
//            }
//            .overlay(content: {
//                Text("Free Guy")
//                    .fontWeight(.semibold)
//                    .foregroundStyle(.white)
//                    .offset(y: -titleProgress > 0.75 ? 0 : 45)
//                    .clipped()
//                    .animation(.easeInOut(duration: 0.25), value: -titleProgress > 0.75)
//            })
//            .padding(.top,safeArea.top)
//            .padding([.horizontal,.bottom],15)
//            .background {
//                Color.black
//                    .opacity(-progress > 1 ? 1: 0)
//            }
//            .offset(y: -minY)
//        }
//        .frame(height: 35)
//    }
}

#Preview {
    MovieDetailView(movie: Movies(adult: false, id: 1, poster_path: "", title: "", overview: "", vote_average: 0.1, original_language: "", backdrop_path: ""))
}
