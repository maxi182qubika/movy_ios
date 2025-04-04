//
//  File.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 26/03/2025.
//

import SwiftUI


struct ListView: View {
    // MARK: Public

    init(viewModel: ListViewModel) {
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
    
    @ObservedObject private var viewModel: ListViewModel
    
    // MARK: Static
    
    static func mock() -> Self {
        .init(viewModel: .mock())
    }

}

