//
//  Functions.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import Foundation
import SwiftUI

// MARK: D-day 계산

class Calculate {
    
    /// startDate와 goalDate를 받아서 Dday를 만들어 주는 함수를 선언합니다.
    static func Dday(from startDate: Date = Date(), to goalDate: Date) -> Int {
        
        /// Calendar 를 사용하여 날짜를 계산합니다.
        let dateDifference = Calendar.current.dateComponents([.day], from: startDate, to: goalDate)

        /// 옵셔널 채이닝 : 값이 없을 경우 옵셔널 형태의 0을 반환합니다.
        /// 하지만 함수 자체가 Int 값을 반환하므로 결국 Int가 나오게 됩니다.
        return dateDifference.day ?? 0
    }
}

// MARK: Postbox Image 변경

func postboxImageName(userData: UserData, goalMoney: Int) -> Image {
    var postboxImageName = "Postbox0-20"
    let percent = goalMoney > 0 ? max(min(Double(userData.total) / Double(goalMoney) * 100, 100), 0) : 0
    
    switch percent {
    case 0..<20:
        postboxImageName = "Postbox0-20"
    case 20..<40:
        postboxImageName = "Postbox20-40"
    case 40..<60:
        postboxImageName = "Postbox40-60"
    case 60..<80:
        postboxImageName = "Postbox60-80"
    case 80...100:
        postboxImageName = "Postbox80-100"
    default:
        break
    }
    return Image(postboxImageName)
}
