//
//  MovieCard.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 31/03/2025.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    var onMoviePress: ((UUID) -> Void)?
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(movie.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 86, height: 147)
                .cornerRadius(4)
                .onTapGesture {
                    onMoviePress?(movie.id)
                }
        }
        
    }
}
