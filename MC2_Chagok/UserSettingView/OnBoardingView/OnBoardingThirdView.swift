//
//  OnBoardingThirdView.swift
//  MC2_Chagok
//
//  Created by hyunjun kim on 2023/05/10.
//

import SwiftUI

struct OnBoardingThirdView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("목표를 달성하고\n하나 뿐인 편지를 선물하세요")
                    .font(.title2)
                    .bold()
                    .padding(.vertical, 95)
                    .lineSpacing(5)
                Image("OnBoardingThird")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Spacer()
            }
        }    }
}

struct OnBoardingThirdView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingThirdView()
    }
}
