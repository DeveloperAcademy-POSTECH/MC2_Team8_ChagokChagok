//
//  LetterB.swift
//  MC2_RaisingTyler@Bentley
//
//  Created by Kim Yejoon on 2023/05/09.
//

import SwiftUI

struct LetterB: View {

    var body: some View {
        ZStack{
            Image("PostBackgroundB")
            
            VStack(alignment: .center) {
                    
                Spacer()
                    .frame(height: 10)
                
                HStack(){
                    // Data - 우표 이미지
                    // 나중에 여유 있을 때 도입해요 -!!
                    Image("postcardBackground")
                        .frame(width: 280, alignment: .trailing)
                }
                
                Spacer()
                    .frame(height: 30)
                
                HStack{
                    // Data - Question
                    Text("스위프트를 처음 만났을 때 나의 감정은?")
                        .font(.custom("GangwonEduSaeeum", size: 22))
                        .frame(width: 280, alignment: .leading)
                }
                
                Spacer()
                    .frame(height: 40)
                
                // Data - Contents
                Text("찾아다녀도, 어디 끓는 구하지 아니다. 찬미를 청춘을 생명을 영원히 인류의 봄바람이다. 끓는 든 길을 크고 소금이라 관현악이며, 반짝이는 할지니. 그렇지 아니한가?")
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

struct LetterB_Previews: PreviewProvider {
    static var previews: some View {
        LetterB()
    }
}
