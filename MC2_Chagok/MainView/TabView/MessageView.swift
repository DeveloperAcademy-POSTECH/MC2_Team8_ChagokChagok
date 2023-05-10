//
//  MessageView.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import SwiftUI

struct MessageView: View {
    
    @State var userData = UserData()
    
    var body: some View {
        ZStack {
            Color.appBeige.ignoresSafeArea()
            
            VStack {
                //                Button ("remove") {
                //                    UserDefaults.standard.removeObject(forKey: "userData")
                //                }
                VStack(alignment: .leading) {
                    Text("우체통 안 편지들")
                        .font(.title)
                        .bold()
                        .padding(.top, 30)
                    Text("\(userData.userdata.count)장 채웠어요")
                        .font(.title2)
                        .padding(.bottom, 20)
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
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }()
    
    @State var userData = UserData()
    let user: User
    @State var open = false
    
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
            HStack(alignment: .top) {
                Text(user.question)
                    .font(.caption)
                Spacer()
                Button {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        open.toggle()
                    }
                } label: {
                    Text(Image(systemName: (open ? "chevron.up" : "chevron.down")))
                        .bold()
                }
            }
            if open == true {
                    Text(user.message)
                        .opacity(open ? 1.0 : 0.0)
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

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
