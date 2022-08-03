//
//  BattleEntity.swift
//  FFT
//
//  Created by Thiago Nitschke Simões on 21/07/22.
//

import Foundation

enum AttackType {
    case normal, special
}

protocol BattleEntity {
    var id: Int { get }
    var name: String { get }
    var hp: Int { get set }
    
    func attack(_ type: AttackType) -> Int
    mutating func damage(by amount: Int)
}

extension BattleEntity {
    mutating func damage(by amount: Int) {
        hp -= amount
    }
}
