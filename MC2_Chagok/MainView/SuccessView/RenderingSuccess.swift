//
//  RenderingSuccess.swift
//  MC2_Chagok
//
//  Created by hyunjun kim on 2023/05/14.
//

import SwiftUI

struct RenderingSuccess: View {
    @State var navigateResetGoalView = false
    @Binding var navigateSuccessView: Bool
    
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
            
            lottieView(name: "popUpConfetti", loopMode: .loop)
            
            VStack{
                Text("🎉")
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(.pink)
                    .padding(.vertical, 20)
                Text("성공적으로 편지를\n앨범과 내폴더에 저장했어요\n목표를 다시 설정해 주세요.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                
                Button {
                    navigateResetGoalView = true
                } label: {
                    Text("목표 다시 설정하기")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 260, height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(Color.appRed)
                                .shadow(color: .appShadow, radius: 5,y: 5)
                        )
                }
                .navigationDestination(isPresented: $navigateResetGoalView) {
                    ResetGoalView(navigateSuccessView: $navigateSuccessView, navigateResetGoalView: $navigateResetGoalView)
                }
            }
        }
    }
}

struct RenderingSuccess_Previews: PreviewProvider {
    static var previews: some View {
        RenderingSuccess(navigateSuccessView: .constant(true))
    }
}
