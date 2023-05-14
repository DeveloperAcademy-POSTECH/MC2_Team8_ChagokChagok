//
//  LottieView.swift
//  MC2_Chagok
//
//  Created by qwd on 2023/05/12.
//
import SwiftUI
import Lottie

struct SuccessPopUpView: View {
    
    @State var navigateSuccessView = false
    
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
                .frame(width: 100, height: 100)

            VStack{
                Text("🎉")
                    .font(.system(size: 40))
                    .imageScale(.large)
                    .foregroundColor(.pink)
                    .padding(.vertical, 20)
                Text("축하합니다!\n**목표**를 달성했어요!")
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                
                Button {
                    navigateSuccessView = true
                } label: {
                    Text("편지 보내러 가기")
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
        .navigationDestination(isPresented: $navigateSuccessView) {
            SuccessView(navigateSuccessView: $navigateSuccessView)
        }
    }
}

struct SuccessPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessPopUpView()
    }
}
