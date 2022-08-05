//
//  Logic.swift
//  Roulette
//
//  Created by Alex on 04.08.2022.
//

import UIKit
import Foundation

class Logic {
    var randomNumber = Int()
    var selectedNumbers = [Int]()
    var score = Int()
    var number = [String]()
    var rate = Int()
    var winNumber = Int()
    var coin = Int()
    
    func checkCombo() {
        if selectedNumbers.count == 1 {
            if selectedNumbers.contains(randomNumber) {
                
                print("win 1 \(randomNumber)")
                score += 35 * rate
                coin += 35 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers.count == 2 {
            if selectedNumbers.contains(randomNumber) {
                print("win 2 \(randomNumber)")
                score += 17 * rate
                coin += 17 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers.count == 3 {
            if selectedNumbers.contains(randomNumber) {
                print("win 3 \(randomNumber)")
                score += 11 * rate
                coin += 11 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers.count == 4 {
            if selectedNumbers.contains(randomNumber) {
                print("win 4 \(randomNumber)")
                score += 8 * rate
                coin += 8 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers.count == 5 {
            if selectedNumbers.contains(randomNumber) {
                print("win 5 \(randomNumber)")
                score += 6 * rate
                coin += 6 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] {
            if selectedNumbers.contains(randomNumber) {
                print("win 1to12 \(randomNumber)")
                score += 2 * rate
                coin += 2 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers == [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23] {
            if selectedNumbers.contains(randomNumber) {
                print("win 2to12 \(randomNumber)")
                score += 2 * rate
                coin += 2 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers == [24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35] {
            if selectedNumbers.contains(randomNumber) {
                print("win 3to12 \(randomNumber)")
                score += 2 * rate
                coin += 2 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers == [0, 1, 2, 3, 12, 13, 14, 15, 24, 25, 26, 27] {
            if selectedNumbers.contains(randomNumber) {
                print("win 1st12 \(randomNumber)")
                score += 2 * rate
                coin += 2 * rate
                print("score: \(score)")
            }
            
        } else if selectedNumbers == [4, 5, 6, 7, 8, 16, 17, 18, 19, 28, 29, 30, 31] {
            if selectedNumbers.contains(randomNumber) {
                print("win 2nd12 \(randomNumber)")
                score += 2 * rate
                coin += 2 * rate
                print("score: \(score)")
            }
            
        } else if selectedNumbers == [8, 9, 10, 11, 20, 21, 22, 23, 32, 33, 34, 35] {
            if selectedNumbers.contains(randomNumber) {
                print("win 3rd12 \(randomNumber)")
                score += 2 * rate
                coin += 2 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers == [0, 1, 2, 3, 4, 5, 12, 13, 14, 15, 16, 17, 24, 25, 26, 27, 28, 29] {
            if selectedNumbers.contains(randomNumber) {
                print("win 1-18 \(randomNumber)")
                score += 1 * rate
                coin += 1 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers == [6, 7, 8, 9, 10, 11, 18, 19, 20, 21, 22, 23, 30, 31, 32, 33, 34, 35] {
            if selectedNumbers.contains(randomNumber) {
                print("win 19-36 \(randomNumber)")
                score += 1 * rate
                coin += 1 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers == [1, 3, 5, 7, 9, 11, 12, 14, 16, 18, 20, 22, 25, 27, 29, 31, 33, 35] {
            if selectedNumbers.contains(randomNumber) {
                print("win even \(randomNumber)")
                score += 1 * rate
                coin += 1 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers == [0, 2, 3, 5, 6, 8, 9, 11, 13, 16, 19, 22, 24, 26, 29, 32, 33, 35] {
            if selectedNumbers.contains(randomNumber) {
                print("win red \(randomNumber)")
                score += 1 * rate
                coin += 1 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers == [1, 4, 7, 10, 12, 14, 15, 17, 18, 20, 21, 23, 25, 27, 28, 30, 31, 34] {
            if selectedNumbers.contains(randomNumber) {
                print("win black \(randomNumber)")
                score += 1 * rate
                coin += 1 * rate
                print("score: \(score)")
            }
        } else if selectedNumbers == [0, 2, 4, 6, 8, 10, 13, 15, 17, 19, 21, 23, 24, 26, 28, 30, 32, 34] {
            if selectedNumbers.contains(randomNumber) {
                print("win odd \(randomNumber)")
                score += 1 * rate
                coin += 1 * rate
                print("score: \(score)")
            }
        }
    }
}
