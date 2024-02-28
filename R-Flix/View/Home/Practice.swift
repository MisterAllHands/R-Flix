//
//  Practice.swift
//  R-Flix
//
//  Created by Mr Producer on 14/12/2023.
//

import SwiftUI
import Kingfisher




struct Practice: View {
    
    var animation: Namespace.ID
    
//    @Binding var selected: Movies
    @Binding var show: Bool
    @StateObject private var viewModel = TrendingViewModel()
    @StateObject private var newReleases = HomeViewModel()
    
    @State var width: Double = 350
    @State var height: Double = 200
    @GestureState var offset: CGFloat = 0
    @State var currentIndex = 0
    
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    HStack {
                        Text("Home")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "magnifyingglass")
                                .renderingMode(.template)
                                .foregroundStyle(.white)
                                .padding(11)
                                .background(.red)
                                .clipShape(Capsule())
                        })
                    }
                    .padding()
                    .padding(.top,UIApplication.shared.windows.first!.safeAreaInsets.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.trendingMovies) { movie in
                                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
                                    AsyncImage(url: movie.poster) { phase in
                                            switch phase {
                                            case .empty:
                                                Color(.gray)
                                                    .frame(width: 350, height: 220)
                                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(maxWidth: 350, maxHeight: 220)
                                                    .overlay {
                                                        LinearGradient(colors: [
                                                            Color.black.opacity(0.9),
                                                            Color.black.opacity(0.6),
                                                            Color.black.opacity(0.3),
                                                            Color.black.opacity(0.1),

                                                        ], startPoint: .leading, endPoint: .trailing)
                                                    }
                                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                                    .matchedGeometryEffect(id: movie.poster, in: animation)
                                            case .failure(let error):
                                                Text("Failed to load image: \(error.localizedDescription)")
                                            @unknown default:
                                                fatalError()
                                            }
                                        }
                                        
                                        
                                    VStack(alignment: .leading, spacing: 8){
                                        HStack{
                                            Text(movie.title)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundStyle(.white)
                                        }
                                        Text("1h 44min")
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        
                                        Spacer(minLength: 0)
                                        
                                        //Movie Categories
                                        HStack(spacing: 15){
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(.ultraThinMaterial)
                                                .frame(width: 90, height: 25)
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(.ultraThinMaterial)
                                                .frame(width: 90, height: 25)
                                        }
                                        .padding(.leading, -15)
                                        .padding(.horizontal)
                                    }
                                    .padding()
                                }
                                .frame(width: 350, height: 220)
                                .padding()
                                .onTapGesture {
                                    withAnimation(.spring()){
//                                        selected = movie
                                        show.toggle()
                                    }
                                }
                                
                            }
                        }
                    }
                    
                    //MARK: New Releases
                    HStack{
                        Text("New releases")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Spacer()
                        
                        Button(action: {
                            //show new releases view
                            
                        }, label: {
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .foregroundStyle(.red)
                        })
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(newReleases.movies) { combinedMovie in
                                NavigationLink(destination: DetailView(movie: combinedMovie).navigationBarBackButtonHidden()) {
                                    VStack(alignment: .leading,spacing: 10){
                                        AsyncImage(url: combinedMovie.poster) { phase in
                                                switch phase {
                                                case .empty:
                                                    Color(.gray)
                                                        .frame(width: UIScreen.main.bounds.width / 2.4, height: UIScreen.main.bounds.height / 3.8)
                                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                                case .success(let image):
                                                    image
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: UIScreen.main.bounds.width / 2.4, height: UIScreen.main.bounds.height / 3.8)
                                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                                        
                                                case .failure(let error):
                                                    Text("Failed to load image: \(error.localizedDescription)")
                                                @unknown default:
                                                    fatalError()
                                                }
                                            }
                                    }
                                    .frame(maxWidth: UIScreen.main.bounds.width / 2.5, maxHeight: .infinity)
                                    .padding(.leading,10)
                                }
                            }
                        }
                    }
                    
                    //MARK: Now Playing
                    HStack{
                        Text("Popular")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .foregroundStyle(.red)
                        })
                    }
                    .padding()
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack{
                            ForEach(viewModel.popular){movie in
                                NavigationLink(destination: Text(""), 
                                               label: {
                                    VStack(alignment: .leading,spacing: 10) {
                                        MovieCard(movie: movie, imageType: movie.poster,type: .grid)
                                        
                                       
                                    }
                                    .cornerRadius(10)
                                    .frame(maxWidth: UIScreen.main.bounds.width / 2.5, maxHeight: .infinity)
                                    .padding(.leading,10)
                                })
                            }
                        }
                    }
                }
            }
            .background(Color.bg.ignoresSafeArea(.all))
            .task {
                await newReleases.loadData()
                await viewModel.fetchData(for: .trending)
                await viewModel.fetchData(for: .popular)
            }
        }
        
    }
}



struct Bookmark: View {
    var body: some View {
        
        VStack{
            Spacer()
            
            Text("Bookmark")
            
            Spacer()
        }
    }
}



struct MainView: View {
    
    @State var tab = "Home"
    @Namespace var animation
    @State var show = false
//    @State var selected: Movies
    @State var selectedNew: CombinedMovie
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0){
                
                switch (tab) {
                case "Home": Practice(animation: animation, show: $show)
                case "Discover": Discover()
                case "Bookmark": Bookmark()
                default: More()
                }
                
                
                Spacer()
                
                HStack(spacing: 0){
                    tabbutton(title: "Home", tab: $tab)
                    
                    Spacer(minLength: 0)
                    
                    tabbutton(title: "Discover", tab: $tab)
                    
                    Spacer(minLength: 0)
                    
                    tabbutton(title: "Bookmark", tab: $tab)
                    
                    Spacer(minLength: 0)

                    tabbutton(title: "More", tab: $tab)

                }
                .padding(.top)
                .padding(.bottom, UIApplication.shared.windows.first!.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first!.safeAreaInsets.bottom)
                .padding(.horizontal, 35)
                .background(Color.black.opacity(0.5))
            }
            
            if show {
//                DetailViews(selected: $selected, show: $show, animation: animation)
            }
        
        }
        .background(Color.bg.ignoresSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}

struct tabbutton: View {
    
    var title: String
    @Binding var tab: String
    
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack(spacing: 8){
                Image(title)
                    .renderingMode(.template)
                    .foregroundStyle(tab == title ? .white : .gray)
                    
                Text(tab == title ? title : "")
                    .foregroundStyle(.white)
            }
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(.red.opacity(tab == title ? 1 : 0))
            .clipShape(Capsule())
        })
    }
}


struct DetailViews: View {
    
    @Binding var selected: Movies
    @Binding var show: Bool
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            
            VStack {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                    KFImage(selected.poster)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 280)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .matchedGeometryEffect(id: selected.poster, in: animation)
                    
                    HStack {
                        Button(action: {
                            withAnimation(.spring()){
                                show.toggle()
                            }
                        }){
                          Image(systemName: "chevron.left")
                                .foregroundStyle(.white)
                                .padding()
                                .background(.black)
                                .clipShape(Circle())
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }){
                          Image(systemName: "ellipsis")
                                .foregroundStyle(.white)
                                .padding()
                                .background(.black)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                })
                
                HStack(alignment: .top){
                    VStack(alignment: .leading, spacing: 12){
                        Text(selected.title)
                            .foregroundStyle(.white)
                            .font(.title.bold())
                    }
                }
            }
            
             Spacer(minLength: 0)
            
        }
        .background(.bg )
    }
}



#Preview {
    MainView(selectedNew: CombinedMovie(title: "", imdbID: "", embedURLImdb: "", type: "", overview: "", voteAverage: 1, voteCount: 1, genreIDS: [], popularity: 1, originalLanguage: ""))
}
