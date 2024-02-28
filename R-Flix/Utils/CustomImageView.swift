//
//  CustomImageView.swift
//  R-Flix
//
//  Created by Mr Producer on 11/12/2023.
//

import SwiftUI
import Kingfisher

struct CustomImageView: View {
    
    let movie: Movies

    let imageType: URL?
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    
    var body: some View {
        KFImage(imageType)
            .resizable()
            .placeholder {
                ZStack{
                    Color.gray
                    Text(movie.title)
                        .font(.headline.weight(.light))
                        .padding()
                }
            }
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: itemWidth, height: itemHeight)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
