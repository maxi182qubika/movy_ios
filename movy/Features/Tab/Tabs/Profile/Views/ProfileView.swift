//
//  ProfileScreenView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 26/03/2025.
//

import SwiftUI


struct ProfileView: View {
    // MARK: Public

    init(viewModel: ProfileViewModel) {
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
    
    @ObservedObject private var viewModel: ProfileViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }

}

