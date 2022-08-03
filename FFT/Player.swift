//
//  Player.swift
//  FFT
//
//  Created by Thiago Nitschke Simões on 18/07/22.
//

import Foundation

struct Player: BattleEntity {
    // Constants
    let id: Int
    let name: String
    let job: Job
    
    // Variables
    var hp: Int
    
    func attack(_ type: AttackType) -> Int {
        let potency = type == .normal ?
                      job.skill().normalAttackPotency :
                      job.skill().specialAttackPotency
        
        return potency * Int.random(in: 0..<6)
    }
}
