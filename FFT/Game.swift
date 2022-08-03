//
//  Game.swift
//  FFT
//
//  Created by Thiago Nitschke Simões on 18/07/22.
//

import Foundation

struct Game {
    
    var players: [BattleEntity]
    var monster: BattleEntity
    
    var currentPlayer: Player?
    var winner: BattleEntity?
    let menu = Menu()
    
    init() {
        let player1 = Player(id: 0, name: "Ramza", job: .squire, hp: 500)
        let player2 = Player(id: 1, name: "Agrias", job: .holyKnight, hp: 500)
        
        self.players = [player1, player2]
        
        let monster = Monster(name: "Goblin", hp: 35, mp: 10, race: "Dark Goblin")
        self.monster = monster
    }
    
    mutating func start() {
        menu.show(.welcome)
        
        while true {
            menu.show(.choices(players))
            let option = menu.ask(for: "Choose a character: ")
            
            switch option {
            case "0":
                currentPlayer = players.first { $0.id == 0 } as? Player
                menu.show(.playerSelection(currentPlayer?.name ?? "Error"))
            case "1":
                currentPlayer = players.first { $0.id == 1 } as? Player
                menu.show(.playerSelection(currentPlayer?.name ?? "Error"))
            default:
                menu.show(.invalidOption)
                continue
            }
            battle()
        }
    }
    
    mutating func isBattleActive() -> Bool {
        if let player = currentPlayer,
           monster.hp > 0 &&
            player.hp > 0 {
            return true
        }
        return false
    }
    
    mutating func battle() {
        while isBattleActive() {
            turn()
        }
    }
    
    mutating func turn() {
        playerTurn()
        
        if monster.hp > 0 {
            enemyTurn()
        }
    }
    
    mutating func playerTurn() {
        guard let currentPlayer = currentPlayer else {
            return
        }
        while true {
            menu.show(.menuAttack)
            let choice = menu.ask(for: "Select an action:")
            
            switch choice {
            case "1":
                turnAction(player: currentPlayer, type: .normal)
                break
            case "2":
                turnAction(player: currentPlayer, type: .special)
                break
            default:
                menu.show(.invalidOption)
                continue
            }
        }
    }
    
    mutating func turnAction(player: Player, type: AttackType) {
        let attackValue = player.attack(type)
        monster.damage(by: attackValue)
        
        menu.show(.attack(player.name,
                          monster.name,
                          attackValue))
    }
    
    mutating func enemyTurn() {
        let attackValue = monster.attack(.normal)
        currentPlayer?.damage(by: attackValue)
        
        menu.show(.attack(monster.name,
                          currentPlayer?.name ?? "Hero",
                          attackValue))
    }
}


