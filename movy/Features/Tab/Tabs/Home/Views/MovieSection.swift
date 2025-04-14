//
//  MovieSection.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 31/03/2025.
//

import SwiftUI


struct MovieSection: View {
    let title: String
    let moviesState: AsyncState<[Movie]>
    let onMoviePress: (UUID) -> Void
    
    var body: some View {

        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    switch moviesState {
                    case .initial, .loading:
                        ForEach(0..<5, id: \.self) { _ in
                            MovieCard(
                                movie: .placeholder,  
                                moviesState: moviesState,
                                onMoviePress: { _ in }
                            )
                        }
                    case .loaded(let movies):
                        ForEach(movies) { movie in
                            MovieCard(
                                movie: movie,
                                moviesState: moviesState,
                                onMoviePress: onMoviePress
                            )
                        }
                    }
                }
                .padding(.horizontal, 5)
            }
        }
    }
}
