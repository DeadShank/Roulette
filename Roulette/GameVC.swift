//
//  GameVC.swift
//  Roulette
//
//  Created by Alex on 04.08.2022.
//

import UIKit

class GameVC: UIViewController {
    @IBOutlet weak var gameCollection: UICollectionView!
    @IBOutlet weak var one2k1Button: UIButton!
    @IBOutlet weak var two2k1Button: UIButton!
    @IBOutlet weak var three2k1Button: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var roundNumberLabel: UILabel!
    @IBOutlet weak var oneTwelveButton: UIButton!
    @IBOutlet weak var twoTwelveButton: UIButton!
    @IBOutlet weak var threeTwelveButton: UIButton!
    @IBOutlet weak var oneEighteenButton: UIButton!
    @IBOutlet weak var evenButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var oddButton: UIButton!
    @IBOutlet weak var ninteteenThirtySixButton: UIButton!
    @IBOutlet weak var imageRoulette: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var minusRateButton: UIButton!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var plusRateButton: UIButton!
    
    
    let redNumbers = [0, 2, 3, 5, 6, 8, 9, 11, 13, 16, 19, 22, 24, 26, 29, 32, 33, 35]
    var selectedIndex = IndexPath(row: -1, section: 0)
    var selectedNumbers = [Int]()
    var userData = UserModel()
    var number = ["3", "6", "9", "12", "15", "18", "21", "24", "27", "30", "33", "36", "2", "5", "8", "11", "14", "17", "20", "23", "26", "29", "32", "35", "1", "4", "7", "10", "13", "16", "19", "22", "25", "28", "31", "34"]
    let allNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36]
    var randomNumber = Int()
    var gameLogic = Logic()
    var score = Int()
    var rate = Int()
    var coin = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGameCollection()
        propElems()
        // Do any additional setup after loading the view.
    }
    
    func propElems() {
        zeroButton.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        zeroButton.layer.borderColor = UIColor.white.cgColor
        zeroButton.layer.borderWidth = 1
        
        one2k1Button.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        one2k1Button.layer.borderColor = UIColor.white.cgColor
        one2k1Button.layer.borderWidth = 1
        
        two2k1Button.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        two2k1Button.layer.borderColor = UIColor.white.cgColor
        two2k1Button.layer.borderWidth = 1
        
        three2k1Button.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        three2k1Button.layer.borderColor = UIColor.white.cgColor
        three2k1Button.layer.borderWidth = 1
        
        oneTwelveButton.layer.borderColor = UIColor.white.cgColor
        oneTwelveButton.layer.borderWidth = 1
        
        twoTwelveButton.layer.borderColor = UIColor.white.cgColor
        twoTwelveButton.layer.borderWidth = 1
        
        threeTwelveButton.layer.borderColor = UIColor.white.cgColor
        threeTwelveButton.layer.borderWidth = 1
        
        oneEighteenButton.layer.borderColor = UIColor.white.cgColor
        oneEighteenButton.layer.borderWidth = 1
        
        evenButton.layer.borderColor = UIColor.white.cgColor
        evenButton.layer.borderWidth = 1
        
        redButton.layer.borderColor = UIColor.white.cgColor
        redButton.layer.borderWidth = 1
        
        blackButton.layer.borderColor = UIColor.white.cgColor
        blackButton.layer.borderWidth = 1
        
        oddButton.layer.borderColor = UIColor.white.cgColor
        oddButton.layer.borderWidth = 1
        
        ninteteenThirtySixButton.layer.borderColor = UIColor.white.cgColor
        ninteteenThirtySixButton.layer.borderWidth = 1
        
        plusRateButton.layer.borderColor = UIColor.white.cgColor
        plusRateButton.layer.borderWidth = 1
        
        rateLabel.layer.borderColor = UIColor.white.cgColor
        rateLabel.layer.borderWidth = 1
        
        minusRateButton.layer.borderColor = UIColor.white.cgColor
        minusRateButton.layer.borderWidth = 1
        
        nameUserLabel.layer.borderColor = UIColor.white.cgColor
        nameUserLabel.layer.borderWidth = 1
        
        coinLabel.layer.borderColor = UIColor.white.cgColor
        coinLabel.layer.borderWidth = 1
        
        scoreLabel.layer.borderColor = UIColor.white.cgColor
        scoreLabel.layer.borderWidth = 1
        
        score = userData.score
        coin = userData.coin
        rate = coin / 10
        
        scoreLabel.text = "Score: \(score)"
        rateLabel.text = "\(rate)"
        nameUserLabel.text = "Name: \(userData.user)"
        
        
        imageRoulette.layer.borderColor = UIColor.black.cgColor
        imageRoulette.layer.borderWidth = 1
        imageRoulette.layer.cornerRadius = imageRoulette.frame.width / 2
        imageRoulette.clipsToBounds = true
        
        coinLabel.text = "Coins: \(coin)"
        
        
    }
    
    func spinRandomNumber() {
        randomNumber = allNumbers.randomElement()!
        print("random number = \(randomNumber)")
        gameLogic.number = number
        gameLogic.randomNumber = randomNumber
        gameLogic.selectedNumbers = selectedNumbers
        gameLogic.rate = rate
        gameLogic.score = score
        gameLogic.coin = coin
        gameLogic.checkCombo()
        score = gameLogic.score
        coin = gameLogic.coin
        roundNumberLabel.text = number[randomNumber]
        selectedNumbers = []
        gameCollection.layer.borderColor = UIColor.white.cgColor
        scoreLabel.text = "Score: \(score)"
    }
    
    func logicData() {
        if rate > coin {
            rateLabel.layer.borderColor = UIColor.red.cgColor
            print("rate > coin")
        } else if selectedNumbers.count == 0 {
            print("selectNumbers = 0")
        } else {
            rateLabel.layer.borderColor = UIColor.white.cgColor
            coin -= rate
            coinLabel.text = "Coins: \(coin)"
            rate = coin / 10
            rateLabel.text = "\(rate)"
            spinRandomNumber()
            if coin < 100 {
                coin += 100
                coinLabel.text = "Coins: \(coin)"
            }
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    
    func createGameCollection() {
        gameCollection.delegate = self
        gameCollection.dataSource = self
    }
    @IBAction func spinButton(_ sender: UIButton) {
        
        logicData()
        
    }
    @IBAction func zeroButton(_ sender: UIButton) {
        selectedNumbers.append(36)
        print("selectedNumbers \(selectedNumbers)")
    }
    
    @IBAction func one2k1Button(_ sender: UIButton) {
        selectedNumbers += [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        print("selectedNumbers \(selectedNumbers)")
    }
    
    @IBAction func two2k1Button(_ sender: UIButton) {
        selectedNumbers += [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
        print("selectedNumbers \(selectedNumbers)")

    }
    
    @IBAction func three2k1Button(_ sender: UIButton) {
        selectedNumbers += [24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]
        print("selectedNumbers \(selectedNumbers)")

    }
    
    @IBAction func oneTwelveButton(_ sender: UIButton) {
        selectedNumbers += [0, 1, 2, 3, 12, 13, 14, 15, 24, 25, 26, 27]
        print("selectedNumbers \(selectedNumbers)")
    }
    
    @IBAction func twoTwelveButton(_ sender: UIButton) {
        selectedNumbers += [4, 5, 6, 7, 8, 16, 17, 18, 19, 28, 29, 30, 31]
        print("selectedNumbers \(selectedNumbers)")
    }
    
    @IBAction func threeTwelveButton(_ sender: UIButton) {
        selectedNumbers += [8, 9, 10, 11, 20, 21, 22, 23, 32, 33, 34, 35]
        print("selectedNumbers \(selectedNumbers)")
    }
    
    @IBAction func oneEighteenButton(_ sender: UIButton) {
        selectedNumbers += [0, 1, 2, 3, 4, 5, 12, 13, 14, 15, 16, 17, 24, 25, 26, 27, 28, 29]
        print("selectedNumbers \(selectedNumbers)")
    }
    
    @IBAction func evenButton(_ sender: UIButton) {
        selectedNumbers += [1, 3, 5, 7, 9, 11, 12, 14, 16, 18, 20, 22, 25, 27, 29, 31, 33, 35]
        print("selectedNumbers \(selectedNumbers)")
    }
    @IBAction func redButton(_ sender: UIButton) {
        selectedNumbers += [0, 2, 3, 5, 6, 8, 9, 11, 13, 16, 19, 22, 24, 26, 29, 32, 33, 35]
        print("selectedNumbers \(selectedNumbers)")
    }
    @IBAction func blackButton(_ sender: UIButton) {
        selectedNumbers += [1, 4, 7, 10, 12, 14, 15, 17, 18, 20, 21, 23, 25, 27, 28, 30, 31, 34]
        print("selectedNumbers \(selectedNumbers)")
    }
    @IBAction func oddButton(_ sender: UIButton) {
        selectedNumbers += [0, 2, 4, 6, 8, 10, 13, 15, 17, 19, 21, 23, 24, 26, 28, 30, 32, 34]
        print("selectedNumbers \(selectedNumbers)")
    }
    @IBAction func ninteteenThirtySixButton(_ sender: UIButton) {
        selectedNumbers += [6, 7, 8, 9, 10, 11, 18, 19, 20, 21, 22, 23, 30, 31, 32, 33, 34, 35]
        print("selectedNumbers \(selectedNumbers)")
    }
    @IBAction func plusRateButton(_ sender: UIButton) {
        if (rate + (coin / 10)) >= coin {
            plusRateButton.layer.borderColor = UIColor.red.cgColor
        } else {
            rate += coin / 10
            print("rate \(rate)")
            rateLabel.text = "\(rate)"
            plusRateButton.layer.borderColor = UIColor.white.cgColor
            minusRateButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBAction func minusRateButton(_ sender: UIButton) {
        if rate < (coin / 10) {
            minusRateButton.layer.borderColor = UIColor.red.cgColor
        } else {
            rate -= coin / 10
            print("rate \(rate)")
            rateLabel.text = "\(rate)"
            minusRateButton.layer.borderColor = UIColor.white.cgColor
            plusRateButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    
}

extension GameVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 36
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let indexesToRedraw = [indexPath]
                selectedIndex = indexPath
        gameCollection.reloadItems(at: indexesToRedraw)
        
        selectedNumbers.append(indexPath.row)
        print("save numbers \(selectedNumbers)")
        print("data \(indexPath.row)")
        gameCollection.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gameCollection.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        
//        if checkBorder == 0 {
//            if redNumbers.contains(indexPath.row) {
//                cell.backgroundColor = UIColor.red
//            } else {
//                cell.backgroundColor = UIColor.black
//
//            }
//            print("checkBorder = \(checkBorder)")
//        } else if checkBorder == 1 {
//
//        }
        if selectedIndex == indexPath { cell.layer.borderColor = UIColor.blue.cgColor}

        
        cell.numberLabel.text = number[indexPath.row]
        
//        if selectedIndex == indexPath { cell.layer.borderColor = UIColor.blue.cgColor}
        
        if redNumbers.contains(indexPath.row) {
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.black

        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: gameCollection.frame.width / 12, height: gameCollection.frame.height / 3)

        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom:0, right: 0)

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
}
