//
//  MyUserData.swift
//  Roulette
//
//  Created by Alex on 18.08.2022.
//

import Foundation

class MyUserData {
    let userDef = UserDefaults.standard
    
    func saveScore(int: Int) {
        userDef.set(int, forKey: "Score")
    }
    
    func getScore() -> Int {
        return userDef.integer(forKey: "Score")
    }
    
    func saveCoins(int: Int) {
        userDef.set(int, forKey: "Coins")
    }
    
    func getCoins() -> Int {
        return userDef.integer(forKey: "Coins")
    }
    
    func saveName(name: String) {
        userDef.set(name, forKey: "Name")
    }
    
    func getName() -> String {
        return userDef.string(forKey: "Name") ?? "not found name"
    }
    
    func saveDocumentId(docID: String) {
        userDef.set(docID, forKey: "DocumentID")
    }
    
    func getDocID() -> String {
        return userDef.string(forKey: "DocumentID") ?? "not found docID"
    }
}
