//
//  ViewModel.swift
//  AllPlatformTask
//
//  Created by Никита Иванов on 04.07.2022.
//

import SwiftUI
import Combine

final class ViewModel: ObservableObject {
    @Published var person: Person = Person()
    let userDefaults = UserDefaults.standard
    var helloNameMessage: String {
        person.name.isEmpty ? "Set your name in settings" : "Hello, \(person.name)!"
    }
    private var scoreBoard: [ScoreBoardItem] = [
        .init(name: "Бывалый", score: 1200),
        .init(name: "Балбес", score: 20000),
        .init(name: "Дурак", score: 900000)
    ]
    
    private var userDefaultsArray = "scoreboard"
    
    func addToLeaderBoard(_ new: Int) {
        scoreBoard.append(.init(name: person.name, score: new))
    }
    
    func getScoreboard() -> [ScoreBoardItem] {
        return scoreBoard.sorted { $0.score > $1.score }
    }
    
    func removeLeaderBoard() {
        scoreBoard = scoreBoard.filter{ $0.name != person.name }
    }
}
