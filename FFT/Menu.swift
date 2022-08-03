//
//  Menu.swift
//  FFT
//
//  Created by Thiago Nitschke Simões on 18/07/22.
//

import Foundation

enum MessageType {
    case welcome
    case attack(String, String, Int)
    case playerSelection(String)
    case invalidOption
    case choices([BattleEntity])
    case menuAttack
    case end
    
    func message() -> String {
        switch self {
        case .welcome:
            return """
                "Welcome!
                """
        case .attack(let attacker, let enemy, let damage):
            return "\(attacker) dealt \(damage) to \(enemy)"
        case .playerSelection(let playerName):
            return "You choose \(playerName)! Battle Starts"
        case .invalidOption:
            return "Invalid option. Please choose again."
        case .menuAttack:
            return """
                    1 - Attack
                    2 - Special Attack
                  """

        case .choices(let charList):
            var string = "Character list"
            for index in charList.indices {
                string += " \n\(index) - \(charList[index].name)"
            }
            return string
        case .end:
            return "Game over"
        }
    }
}

struct Menu {
    
    func show(_ type: MessageType) {
        print(type.message())
    }
    
    func ask(for info: String) -> String {
        print(info)
        guard let reply = readLine() else {
            return ""
        }
        return reply
    }
    
    func start() {
     
    }
}
