//
//  OnBoardingFirstView.swift
//  MC2_Chagok
//
//  Created by hyunjun kim on 2023/05/10.
//

import SwiftUI

struct OnBoardingFirstView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("설레는 데이트 날을 위해\n목표금액을 설정하세요")
                    .font(.title)
                    .bold()
                    .padding(.vertical, 90)
                    .lineSpacing(5)
                    .frame(width: 310, alignment: .leading)
                Image("OnBoardingFirst")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Spacer()
            }
        }
    }
}

struct OnBoardingFirstView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingFirstView()
    }
}
