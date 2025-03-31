//
//  MovieSection.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 31/03/2025.
//

import SwiftUI

struct MovieSection: View {
    let title: String
    let movies: [Movie]
    let onMoviePress: (UUID) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack() {
                    ForEach(movies) { movie in
                        MovieCard(movie: movie, onMoviePress: { id in
                            onMoviePress(id)
                        })
                    }
                }
                .padding(.horizontal, 5)
            }
        }
    }
}
