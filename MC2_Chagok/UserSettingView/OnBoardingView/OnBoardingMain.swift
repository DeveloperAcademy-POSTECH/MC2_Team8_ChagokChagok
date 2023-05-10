//
//  OnBoardingMain.swift
//  ChagokChagok
//
//  Created by hyunjun kim on 2023/05/10.
//

import SwiftUI

struct OnBoardingMain: View {
    
    @Binding var onBoarding: Bool
    @State var selection = 0
    
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            VStack {
                TabView(selection: $selection) {
                    Text("FirstView").tag(0)
                    Text("onboarding second").tag(1)
                    VStack {
                        Text("onboarding third")
                            .padding(.top, 60)
                        Spacer()
                    }
                    .padding(.bottom, 60)
                    .tag(2)
                }
                .padding(.bottom)
                CustomButton(label: "시작하기", disable: selection != 2) {
                    onBoarding = false
                }
                .padding(.bottom, 40)
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
