// Created by Bruno Martinez on 9/3/25.

import SwiftUI

struct OnboardingHeader: View {
    let action: () -> Void
    var body: some View {
        HStack {
            Text(StringConstants.App.appName)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color.customBlueLight)
            Spacer()
            Button(action: action) {
                Text(StringConstants.Onboarding.StepOne.signIn)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color.customBlueLight)
            }
        }
    }
}
