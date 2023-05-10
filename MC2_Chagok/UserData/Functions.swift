//
//  Functions.swift
//  ChagokChagok
//
//  Created by 김현준 on 2023/05/08.
//

import Foundation

class Calculate {
    static func Dday(from startDate: Date = Date(), to goalDate: Date) -> Int {
        
        /// Calendar 를 사용하여 날짜를 계산
        let dateDifference = Calendar.current.dateComponents([.day], from: startDate, to: goalDate)

        /// 옵셔널 채이닝 : 값이 없을 경우 옵셔널 형태의 0을 반환한다
        /// 하지만 함수 자체가 Int 값을 반환하므로 결국 Int가 나오게 된다.
        return dateDifference.day ?? 0
    }
}

