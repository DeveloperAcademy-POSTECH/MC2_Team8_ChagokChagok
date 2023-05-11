//
//  OnBoardingMain.swift
//  ChagokChagok
//
//  Created by hyunjun kim on 2023/05/10.
//

import SwiftUI

struct OnBoardingMain: View {
    
    @State var selection = 0
    @Binding var onBoarding: Bool
    
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            VStack {
                TabView(selection: $selection) {
                    OnBoardingFirstView().tag(0)
                    OnBoardingSecondView().tag(1)
                    OnBoardingThirdView().tag(2)
                }
                .padding(.bottom)
                CustomButton(label: "시작하기", disable: selection != 2) {
                    onBoarding = false
                }
                .padding(.bottom, 20)
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
