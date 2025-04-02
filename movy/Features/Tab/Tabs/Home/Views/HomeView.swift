//
//  HomeScreen.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 26/03/2025.
//

import SwiftUI

struct HomeView: View {
    // MARK: Public
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView() {
            VStack() {
                ZStack(alignment: .bottom) {
                    Image("altered_carbon")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .ignoresSafeArea(edges: .top)
                    
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.1), Color.black]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 200)
                    .ignoresSafeArea(edges: .top)
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 16) {
                            Text("Kids")
                            Circle().fill(Color.white).frame(width: 5, height: 5)
                            Text("Fantasy Movie")
                            Circle().fill(Color.white).frame(width: 5, height: 5)
                            Text("Action")
                        }
                        .foregroundColor(.white)
                        .font(.subheadline)
                        
                        Text("MOVY ORIGINAL")
                            .font(.headline)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 8)
                            .background(Color.blue.opacity(0.4))
                            .foregroundColor(.colorBlueLight)
                            .cornerRadius(8)
                        
                        HStack {
                            IconTextView(text: "My List", image: Image(systemName: "plus"))
                            IconTextView(text: "Play", image: Image(systemName: "play.circle"))
                            Button(action: {
                                viewModel.openInfo()
                            }) {
                                IconTextView(text: "Info", image: Image(systemName: "info.circle"))
                            }
                        }
                    }
                    .padding(.bottom, 24)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    MovieSection(
                        title: "My List",
                        movies: viewModel.movies,
                        onMoviePress: viewModel.showMovieDetail
                    )
                    MovieSection(
                        title: "Trending Now",
                        movies: viewModel.movies,
                        onMoviePress: viewModel.showMovieDetail
                    )
                    MovieSection(
                        title: "Recently Added",
                        movies: viewModel.movies,
                        onMoviePress: viewModel.showMovieDetail
                    )
                }
                .padding(.horizontal, 10)
            }
        }.padding(.bottom, 1)
            .background(Color.black)
            .ignoresSafeArea(.all, edges: .top)
            .onAppear {
                viewModel.loadMovies()
            }
    }
    
    // MARK: Private
    
    @ObservedObject private var viewModel: HomeViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }
    
}

#Preview {
    HomeView(viewModel: HomeViewModel(coordinator: HomeCoordinator()))
}
