//
//  LetterA.swift
//  MC2_RaisingTyler@Bentley
//
//  Created by Kim Yejoon on 2023/05/09.
//

import SwiftUI

struct LetterA: View {
    
    @State var userData = UserData()
    
    var body: some View {
        
        ZStack{
            Image("PostBackground")
            
            VStack(alignment: .center) {
                    
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
                    Text(userData.userdata[0].question)
                        .font(.custom("GangwonEduSaeeum", size: 22))
                        .frame(width: 280, alignment: .leading)
                }
                
                Spacer()
                    .frame(height: 40)
                
                HStack{
                    // Data - Contents
                    Text(userData.userdata[0].message)
                        .font(.custom("GangwonEduSaeeum", size: 20))
                        .lineSpacing(33)
                        .frame(width: 280)
                        .opacity(0.6)
                }
                
                Spacer()
                    .frame(height: 50)
                
                HStack{
                    // Data - Image
                    Image("Image_1")
                }
            }
            .frame(minWidth: 390, minHeight: 844)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct LetterA_Previews: PreviewProvider {
    static var previews: some View {
        LetterA()
    }
}
