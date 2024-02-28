//
//  MovieCard.swift
//  R-Flix
//
//  Created by Mr Producer on 11/12/2023.
//

import SwiftUI

struct MovieCard: View {
    
    let movie: Movies
    let imageType: URL?
    var type: MovieCardType = .poster
    
    var body: some View {
        CustomImageView(movie: movie, imageType: imageType, itemWidth: itemWidth, itemHeight: itemHeight)
    }
}

extension MovieCard{
    var itemWidth: CGFloat{
        screenWidth * type.widthPercent
    }
    var itemHeight: CGFloat{
        screenHeight * type.heightPercent
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View{
        MovieCard(movie: dev.movie, imageType: URL(string: ""))
    }
}
