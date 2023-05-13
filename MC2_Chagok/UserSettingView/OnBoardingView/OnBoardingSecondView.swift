//
//  OnBoardingSecondView.swift
//  MC2_Chagok
//
//  Created by hyunjun kim on 2023/05/10.
//

import SwiftUI

struct OnBoardingSecondView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("마음을 담은 돈과 편지를\n우체통에 채워보세요")
                    .font(.title)
                    .bold()
                    .padding(.vertical, 90)
                    .lineSpacing(5)
                    .frame(width: 310, alignment: .leading)
                Image("OnBoardingSecond")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Spacer()
            }
        }    }
}

struct OnBoardingSecondView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSecondView()
    }
}
