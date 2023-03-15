//
//  GameNumbers.swift
//  Rightandtarget_attempt2
//
//  Created by Аделия Исхакова on 14.03.2023.
//

import Foundation

class GameNumbers: GameProtocol {
    var isGameEnded: Bool
    
    var rounds = 5
    
    var round = 0
    
    var score = 1
    
    var minSecretValue : Int
    var maxSecretValue : Int
    
    var currentSecretValue: Int = 0
    
    init?(rounds: Int = 5, startSecretValue: Int = 1, endSecretValue: Int = 50) {
        self.isGameEnded = false
        self.rounds = rounds
        minSecretValue = startSecretValue
        maxSecretValue = endSecretValue
        currentSecretValue = self.generatorSecret()
    }
    
    func restartGame() {
        round = 0
        currentSecretValue = generatorSecret()
        isGameEnded = false
        score = 0
    }
    
    func nextRound() {
        currentSecretValue = generatorSecret()
        round+=1
        if round >= rounds {
            isGameEnded = true
        }
    }
    
    
    func generatorSecret() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    func calculateScore(value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
