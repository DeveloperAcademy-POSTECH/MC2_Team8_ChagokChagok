//
//  ContentView.swift
//  popup-view
//
//  Created by 박진영 on 2023/05/08.
//

import SwiftUI

struct PopupViewByClaudia: View {
    @State var transitionView: Bool = false
    
    var body: some View {
        ZStack {
            Image("Image")
                .ignoresSafeArea()
                .blur(radius: 0.5)
            
            Rectangle()
                .fill(Color.black)
                .opacity(0.3)
                .ignoresSafeArea()
            
            if transitionView {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 300, height: 300)
                        .cornerRadius(15)
                        .shadow(radius: 10, x: 0, y: 10)
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("🎉")
                            .font(.system(size: 40))
                            .imageScale(.large)
                            .foregroundColor(.pink)
                            .padding(.bottom, 15)
                        
                        Text("축하합니다!\n**목표**를 달성했어요!")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 20)
                        
                        Button(action: {
                            print("Hello")
                            withAnimation {
                                self.transitionView.toggle()
                            }
                        }){
                            Rectangle()
                                .fill(Color(hue: 1.0, saturation: 0.367, brightness: 0.924))
                                .frame(width:250, height:50)
                                .cornerRadius(30)
                                .overlay(Text("편지 보내러가기")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 1.0)))

                        }
                    }
                }
                .transition(.scale)
                .animation(.easeInOut(duration: 1), value: transitionView)
            }
            
            Button(action: {
                withAnimation {
                    self.transitionView.toggle()
                }
            }) {
                Text("Button")
                    .foregroundColor(Color.white)
            }
            .offset(y:285)
        }
    }
}

struct SuccessPopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupViewByClaudia()
    }
}
