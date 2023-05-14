//
//  LetterC.swift
//  MC2_RaisingTyler@Bentley
//
//  Created by Kim Yejoon on 2023/05/09.
//

import SwiftUI

struct LetterC: View {
    
    @State var userData = UserData()
    let user: User
    let imageC: Int

    var body: some View {
        ZStack{
            Image("PostBackgroundC")
            
            VStack(alignment: .center) {
                
                Spacer()
                    .frame(height: 40)
                    
                HStack(){
                    // Data - 우표 이미지
                    // 나중에 여유 있을 때 도입해요 -!!
                    Image("postcardBackground")
                        .frame(width: 280, alignment: .trailing)
                }
                
                Spacer()
                    .frame(height: 45)
                
                HStack{
                    // Data - Image
                    Image("\(imageC)")
                }
                
                Spacer()
                    .frame(height: 30)
                
                HStack{
                    // Data - Question
                    Text("\(user.question)")
                        .font(.custom("GangwonEduSaeeum", size: 22))
                        .frame(width: 280, alignment: .leading)
                }
                
                Spacer()
                    .frame(height: 40)
                
                // Data - Contents
                Text("\(user.message)")
                    .font(.custom("GangwonEduSaeeum", size: 20))
                    .lineSpacing(33)
                    .frame(width: 280, height: 200, alignment: .topLeading)
                    .opacity(0.6)
                
                Spacer()
                    .frame(height: 50)
                
            }
            .frame(minWidth: 390, minHeight: 844)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LetterC_Previews: PreviewProvider {
    static var previews: some View {
        LetterC(user: UserData().userdata[0], imageC: 1)
    }
}
