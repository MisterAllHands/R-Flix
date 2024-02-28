//
//  GenreCard.swift
//  R-Flix
//
//  Created by Mr Producer on 13/12/2023.
//

import SwiftUI

struct GenreCard: View {
    
    let genre: Ganre
    let namespace: Namespace.ID
    @Binding var selectedGanre: Ganre
    
    var body: some View {
        Text(genre.name)
            .font(genre.id == selectedGanre.id ? .system(size: 18, weight: .bold) : .system(size: 18, weight: .regular))
            .foregroundStyle(.white)
            .background {
                ZStack{
                    if selectedGanre.id == genre.id {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(height: 3)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "GenreCard", in: namespace)
                    }
                }
            }
            .padding()
    }
}
//
//#Preview {
//    HomeView(animation: Namespace().wrappedValue)
//}
