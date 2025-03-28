//
//  InfoView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 27/03/2025.
//

import SwiftUI


struct InfoScreenView: View {
    // MARK: Public

    init(viewModel: InfoViewModel) {
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
    
    @ObservedObject private var viewModel: InfoViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }

}

