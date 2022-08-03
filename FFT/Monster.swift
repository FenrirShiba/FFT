//
//  Monster.swift
//  FFT
//
//  Created by Thiago Nitschke Simões on 18/07/22.
//

import Foundation

struct Monster: BattleEntity {
    let id: Int = 0
    let name: String
    var hp: Int
    var mp: Int
    let race: String?
    
    func skill() -> String {
        return "Normal Attack"
    }
    
    func attack(_ type: AttackType) -> Int {
        return Int.random(in: 0..<6)
    }
}
