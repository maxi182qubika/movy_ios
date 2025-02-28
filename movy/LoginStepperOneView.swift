//
//  LoginStepper_1.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 21/02/2025.
//

import SwiftUI


struct LoginStepOneView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(StringConstants.App.appName)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color.customBlueLight)
                
                Spacer()
                
                Text(StringConstants.LogginStepperOne.signIn)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color.customBlueLight)
            }
            .padding(.horizontal)
            
            Spacer().frame(height: 20)
            
            HStack {
                Circle()
                    .stroke(Color.customBlueLight, lineWidth: 2)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.customBlueLight)
                            .font(.system(size: 20, weight: .bold))
                    )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(StringConstants.LogginStepperOne.step1_3)
                    .font(.system(size: 14, weight: .bold))
                
                
                Text(StringConstants.LogginStepperOne.selectPlan)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 24) {
                CheckmarkText(text: StringConstants.LogginStepperOne.checkMark_1)
                CheckmarkText(text: StringConstants.LogginStepperOne.checkMark_2)
                CheckmarkText(text: StringConstants.LogginStepperOne.checkMark_3)
            }
            .padding(.horizontal)
            
            Spacer() // toma espacio hasta el final
            NavigationLink(destination: LoginStepTwoView()) {
                RoundedButtonComp(text: StringConstants.LogginStepperOne.viewPlans)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .padding(.top, 40)
        .padding(.horizontal, 24)
    }
}

struct CheckmarkText: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "checkmark")
                .foregroundColor(Color.customBlueLight)
                .font(.system(size: 18, weight: .bold))
            
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.black)
        }
    }
}

struct LoginStepOneView_Previews: PreviewProvider {
    static var previews: some View {
        LoginStepOneView()
    }
}
