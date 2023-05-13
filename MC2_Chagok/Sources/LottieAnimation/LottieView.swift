//
//  LottieView.swift
//  MC2_Chagok
//
//  Created by qwd on 2023/05/12.
//

import SwiftUI
import Lottie

struct lottieView: UIViewRepresentable{
    
    let name: String
    let loopMode : LottieLoopMode
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: name)
        animationView.loopMode = loopMode
        animationView.play()

        
        return animationView
    }
    
    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
        //do nothing
    }
}

//lottieView(name: "test", loopMode: .loop)
//    .background(Color.white.opacity(0.3))
//    .scaleEffect(0.5)
