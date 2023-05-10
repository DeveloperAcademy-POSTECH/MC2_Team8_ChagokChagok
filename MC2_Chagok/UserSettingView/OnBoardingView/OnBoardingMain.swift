//
//  OnBoardingMain.swift
//  ChagokChagok
//
//  Created by hyunjun kim on 2023/05/10.
//

import SwiftUI

struct OnBoardingMain: View {
    
    @Binding var onBoarding: Bool
    
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            VStack {
                TabView {
                    Text("FirstView")
                    Text("onboarding second")
                    VStack {
                        Text("onboarding third")
                            .padding(.top, 60)
                        Spacer()
                    }
                    .padding(.bottom, 60)
                }
                .padding(.bottom)
                .padding(.bottom)
                CustomButton(label: "시작하기", disable: false) {
                    onBoarding = false
                }
                .padding(.bottom)
                .padding(.bottom)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingMain(onBoarding: .constant(true))
    }
}
