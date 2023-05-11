//
//  MessageView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct PostboxView: View {
    
    @State var userData = UserData()
    
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    Text("우체통 안 편지들")
                        .font(.title2)
                        .bold()
                        .padding(.top, 30)
                        .padding(.bottom, 1)
                    Text("\(userData.userdata.count)장 채웠어요")
                        .padding(.bottom, 20)
                        .font(.callout)
                        .foregroundColor(.appGray)
                }
                .frame(width: 330, alignment: .leading)
                ScrollView {
                    VStack {
                        /// UserData 배열
                        ForEach(userData.userdata) { user in
                            MessageCard(user: user)
                                .frame(maxWidth: 380)
                                .padding(.bottom)
                        }
                    }
                }
            }
            .onAppear {
                userData = UserData()
            }
        }
    }
}

struct MessageCard: View {
    
    @State var userData = UserData()
    @State var open = false

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }()
    let user: User
    
    var body: some View {
                
        VStack(alignment: .leading) {
            HStack{
                Text(dateFormatter.string(from: user.date))
                Spacer()
                Text("\(user.money)원")
            }
            .foregroundColor(.appRed)
            .bold()
            .padding(.bottom)
            HStack(alignment: .firstTextBaseline) {
                Text(user.question)
                    .font(.callout)
                Spacer()
                Button {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        open.toggle()
                    }
                } label: {
                    Text(Image(systemName: "chevron.down"))
                        .rotationEffect(open ? .degrees(180) : .degrees(0))
                        .bold()
                }
            }
            if open == true {
                    Text(user.message)
                        .opacity(open ? 1.0 : 0.0)
                        .padding(.top)
            }
        }
        
        .onAppear {
            userData = UserData()
        }
        .padding()
        .frame(width: 330)
        .clipped()
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(open ? Color.appDarkBeige : Color.appBeige)
                .shadow(color: Color(.systemGray5),radius: 5,y: 5)
        )
        .tint(.appRed)
    }
}

struct PostboxView_Previews: PreviewProvider {
    static var previews: some View {
        PostboxView()
    }
}
