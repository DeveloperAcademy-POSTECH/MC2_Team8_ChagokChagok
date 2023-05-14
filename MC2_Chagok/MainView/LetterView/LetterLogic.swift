//
//  SwiftUIView.swift
//  MC2_Chagok
//
//  Created by hyunjun kim on 2023/05/14.
//

import SwiftUI

struct LetterLogic: View {
    
    @State var userData = UserData()
    @State var question = Question()
    
    var body: some View {
        ForEach(userData.userdata) { user in
            if let index = question.question.firstIndex(of: user.question) {
                if index % 2 == 0 {
                    LetterC(user: user, imageC: index + 1)
                } else {
                    LetterA(user: user, imageA: index + 1)
                }
            }
        }
    }
}

struct LetterLogic_Previews: PreviewProvider {
    static var previews: some View {
        LetterLogic()
    }
}
