//
//  ChallengeMainViewModel.swift
//  TeemonDeo
//
//  Created by TEO on 8/1/24.
//

import Foundation
import SwiftUI




class ChallengeMainViewModel: ObservableObject{
    
    @Published var challenges: [Challenge] = []
    //@Published var challengeUser: ChallengeUser = ChallengeUser()
    
    let fireStoreChallengeManager = FireStoreChallengeManager()
    @Published var challengesCount: Int = 0
    

//    func fetchUserData() {
//        challengeUser = UserManager.shared.getUser(userId:fireStoreChallengeManager.userId ?? "")
//
//    }
    
    // READ
    func loadChallnege() {
        fireStoreChallengeManager.fetchChallenges()
        challenges = fireStoreChallengeManager.challenges
    }
    
    // CREATE
    func uploadChallenge(challenge: Challenge) {
        fireStoreChallengeManager.addChallenge(challenge: challenge)
    }
    
    func countChallenge(challenge: Challenge) async throws {
        challengesCount = try await fireStoreChallengeManager.countChallenge()
    }
    
}
