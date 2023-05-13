//
//  FailPopupView.swift
//  MC2_Chagok
//
//  Created by hyunjun kim on 2023/05/11.
//

import SwiftUI

struct FailPopupView: View {
    
    @State var navigateGoalSettingView = false
    @State var navigateUserGoalSettingAgainView = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color.black)
                .opacity(0.5)
            
            Rectangle()
                .fill(Color.appBeige)
                .frame(width: 320, height: 320)
                .cornerRadius(20)
                .shadow(radius: 10, x: 0, y: 10)
            VStack{
                Text("⌛️")
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(.pink)
                    .padding(.vertical, 20)
                Text("너무 아쉬워요!\n하지만 편지들은 사라지지 않아요\n다시 한번 도전해보세요!")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                
                Button {
                    navigateGoalSettingView = true
                } label: {
                    Text("목표 재설정하러 가기")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 260, height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(Color.appRed)
                                .shadow(color: .appShadow, radius: 5,y: 5)
                        )
                }
            }
        }
    }
}

struct FailPopupView_Previews: PreviewProvider {
    static var previews: some View {
        FailPopupView()
    }
}
