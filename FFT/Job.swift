//
//  Job.swift
//  FFT
//
//  Created by Thiago Nitschke Simões on 21/07/22.
//

import Foundation

enum Job: String {
    case squire = "Squire"
    case holyKnight = "Holy Knight"
    
    func skill() -> JobSkills {
        switch self {
        case .squire:
            let squire = JobSkills(normalAttackName: "Attack", normalAttackPotency: 25, specialAttackName: "Throw Stone", specialAttackPotency: 15)
            return squire
        case .holyKnight:
            let holyKnight = JobSkills(normalAttackName: "Attack", normalAttackPotency: 25, specialAttackName: "Holy Judgment", specialAttackPotency: 35)
            return holyKnight
        }
    }
}

struct JobSkills {
    var normalAttackName: String
    var normalAttackPotency: Int
    var specialAttackName: String
    var specialAttackPotency: Int
}


