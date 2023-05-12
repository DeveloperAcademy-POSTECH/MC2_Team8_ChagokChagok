//
//  videoBackGroundView.swift
//  test
//
//  Created by qwd on 2023/05/07.
//

import SwiftUI
import AVFoundation
import UIKit


/// 비디오 백그라운드 뷰
struct VideoBackGroundView: View{
    
    var body: some View{
        ZStack{
            LoopingVideoPlayerView().edgesIgnoringSafeArea(.all)
        }
    }
}


/// swiftui 에서 uikit의 uiview 쓰려면 makeUIView랑 updateUIView를 꼭 써야됨!!
fileprivate struct LoopingVideoPlayerView: UIViewRepresentable{
    func makeUIView(context: Context) -> UIView {
        /// 일단 크기 zero로 세팅해 둠
        return  LoopingVideoPlayerUIView(frame: .zero)
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        //nothing
    }
}



/// 이 파일 안에서만 사용할 수 있도록 함!
/// 반복 비디오 플레이어 uiview : uikit에 있는 걸 활용
fileprivate class LoopingVideoPlayerUIView: UIView{
    fileprivate var playerLayer = AVPlayerLayer()
    fileprivate var playerLooper : AVPlayerLooper?
    
    ///여기서 파일 가져온다
    override init(frame:CGRect){
        super.init(frame: frame)
        
        func postboxImageNames(userData: UserData, goalMoney: Int) -> Int {
            var postboxImageName = 0
            let percent = goalMoney > 0 ? max(min(Double(userData.total) / Double(goalMoney) * 100, 100), 0) : 0
            
            switch percent {
            case 0..<20:
                postboxImageName = 0
            case 20..<40:
                postboxImageName = 1
            case 40..<60:
                postboxImageName = 2
            case 60..<80:
                postboxImageName = 3
            case 80...100:
                postboxImageName = 4
            default:
                break
            }
            return postboxImageName
        }

        let video = ["0-20","20-40","40-60","60-80","80-100"]
        
        var videoFile = Bundle.main.url(forResource: video[postboxImageNames(userData: UserData(), goalMoney: UserDefaults.standard.integer(forKey: "realGoalMoney"))], withExtension: "mp4")!
        let playerItem = AVPlayerItem(url:videoFile)
        
        /// 플레이어 세팅하기 : 여기서는 한 개만 반복 중
        let queuePlayer = AVQueuePlayer(playerItem: playerItem)
        playerLayer.player = queuePlayer
        /// 사이즈 꽉 채우기
        playerLayer.videoGravity = .resizeAspectFill
        
        
        /// 뷰 최상단 층 아래에 영상 재생하는 비디오의 레이어를 넣는다
        self.layer.addSublayer(playerLayer)
        
        //여기 자동생성됨
        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem:playerItem)
        //여기 자동생성됨
        queuePlayer.play()
        
    }
    
    /// 영상에서 쓰는 레이어 크기와 뷰의 레이어 크기 맞춰주기
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    //여기 자동 생성됨
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
