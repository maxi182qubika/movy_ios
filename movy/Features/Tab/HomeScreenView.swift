//
//  HomeScreen.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 26/03/2025.
//

import SwiftUI

struct HomeScreenView: View {
    // MARK: Public
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            ZStack {
                Image("altered_carbon")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .ignoresSafeArea()
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.1), Color.black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 16) {
                        Text("Kids")
                        Circle().fill(Color.white).frame(width: 5, height: 5)
                        Text("Fantasy Movie")
                        Circle().fill(Color.white).frame(width: 5, height: 5)
                        Text("Action")
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    
                    Text("MOVY ORIGINAL")
                        .font(.headline)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.4))
                        .foregroundColor(.colorBlueLight)
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity, alignment: .center)
                    HStack {
                        IconTextView(text: "My List", image: Image(systemName: "plus"))
                        IconTextView(text: "Play", image: Image(systemName: "play.circle"))
                        Button(action: {
                            viewModel.openInfo()
                           }) {
                               IconTextView(text: "Info", image: Image(systemName: "info.circle"))
                           }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
               
                Spacer()
                
            }
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
    
    // MARK: Private
    
    @ObservedObject private var viewModel: HomeViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }
    
}

#Preview {
    HomeScreenView(viewModel: HomeViewModel(coordinator: HomeCoordinator(screenType: .home)))
}
