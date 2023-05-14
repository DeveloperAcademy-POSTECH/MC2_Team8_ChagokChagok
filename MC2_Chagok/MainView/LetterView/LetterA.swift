//
//  LetterA.swift
//  MC2_RaisingTyler@Bentley
//
//  Created by Kim Yejoon on 2023/05/09.
//

import SwiftUI

struct LetterA: View {

    /*
    guard let image = ImageRenderer(content: body).uiImage
    */
     
    @State var userData = UserData()
    let user: User
    let imageA: Int

    
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
                .frame(minHeight: 0)
                
                Spacer()
                    .frame(height: 30)
                
                HStack{
                    // Data - Question
                    Text("\(user.question)")
                        .font(.custom("GangwonEduSaeeum", size: 22))
                        .frame(width: 280, alignment: .leading)
                }
                .frame(minHeight: 30)
                
                Spacer()
                    .frame(height: 30)
                
                // Data - Contents
                Text("\(user.message)")
                    .font(.custom("GangwonEduSaeeum", size: 20))
                    .lineSpacing(33)
                    .frame(width: 280, height: 200, alignment: .topLeading)
                    .opacity(0.6)
                
                Spacer()
                    .frame(height: 50)
                
                HStack{
                    // Data - Image
                    Image("\(imageA)")
                }
                .frame(minHeight: 0)
            }
            .frame(minWidth: 390, minHeight: 844)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct LetterA_Previews: PreviewProvider {
    static var previews: some View {
        LetterA(user: UserData().userdata[0], imageA: 1)
    }
}
