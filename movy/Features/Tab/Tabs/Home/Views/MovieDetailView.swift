//
//  HomeDetailView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 31/03/2025.
//


import SwiftUI


struct MovieDetailView: View {
    // MARK: Public

    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
           
            RoundedButtonComp(
                text: StringConstants.Onboarding.StepSixth.btnContinue,
                action: { }
            )
            Spacer()
        }
        .padding(.horizontal)
    }
    
    // MARK: Private
    
    @ObservedObject private var viewModel: MovieDetailViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }

}


