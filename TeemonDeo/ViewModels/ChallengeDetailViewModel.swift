//
//  ChallengeDetailViewModel.swift
//  TeemonDeo
//
//  Created by 김민정 on 7/31/24.
//

//import Foundation
//import SwiftUI
//
//class ChallengeDetailViewModel: ObservableObject {
//    
//    // var firestoreChallengeManager = FirestoreChallengeManager()
//    
//    // func loadData(challengeId: String) {
//    //      challengeData = firestoreChallengeManager.getData(challengeId)
//    // }
//    
//    // var challengeData: Challenge = Challenge()
//    
//    
//    var challengeData: Challenge = Challenge(id: UUID().uuidString, challengeName: "책상부터 비워보자", challengeStartDate: "2024.07.21", challengePeriod: 1, challengeSpace: "책상", isChallengeSucceed: false)
//    
//
//
//}

import Foundation

struct DateHelper {
    // 날짜 형식 설정
    private static let dateFormat = "yyyy.MM.dd"

    // 종료 날짜를 계산하는 함수
    static func calculateEndDate(startDate: String, period: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        guard let start = dateFormatter.date(from: startDate) else {
            return "잘못된 날짜"
        }

        guard let endDate = Calendar.current.date(byAdding: .day, value: period, to: start) else {
            return "날짜 계산 오류"
        }

        return dateFormatter.string(from: endDate)
    }

    // 현재 도전일을 계산하는 함수
    static func calculateCurrentDay(startDate: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        guard let start = dateFormatter.date(from: startDate) else {
            return 0
        }

        let currentDate = Date()
        let components = Calendar.current.dateComponents([.day], from: start, to: currentDate)

        return max(0, components.day ?? 0)
    }

    // 진행도를 계산하는 함수
    static func calculateProgress(startDate: String, period: Int) -> Int {
        let currentDay = calculateCurrentDay(startDate: startDate)
        let progress = Double(currentDay) / Double(period*7) * 100
        return Int(progress)
    }
}
