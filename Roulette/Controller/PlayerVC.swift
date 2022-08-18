//
//  PlayerVC.swift
//  Roulette
//
//  Created by Alex on 11.08.2022.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class PlayerVC: UIViewController {
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    var userData = UserModel()
    var userDef = MyUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        propElems()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        propElems()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func propElems() {
        userLabel.text = userDef.getName()
        coinsLabel.text = String(userDef.getCoins())
        scoreLabel.text = String(userDef.getScore())
        
        userData.user = userDef.getName()
        userData.documentId = userDef.getDocID()
        userData.score = userDef.getScore()
        userData.coin = userDef.getCoins()
        print(userData)
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        let myStoryBoard = UIStoryboard.init(name: "GameStoryboard", bundle: nil)
        let vc = myStoryBoard.instantiateViewController(withIdentifier: "GameVC") as! GameVC
        vc.userData = userData
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func getData() {
        let userRef = db.collection("usersData")
            .whereField("user", isEqualTo: userTF.text ?? "")
            .whereField("password", isEqualTo: passTF.text ?? "")
        userRef.getDocuments() { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let document = snapshot?.documents.first else { return }
            let data = document.data()
            let user = UserModel(user: data["user"] as? String ?? "",
                                 coin: data["coin"] as? Int ?? 0,
                                 score: data["score"] as? Int ?? 0,
                                 documentId: data["documentId"] as? String ?? "")
            self.userData = user
            self.userLabel.text = "Name: \(self.userData.user)"
            self.coinsLabel.text = "Coins: \(self.userData.coin)"
            self.scoreLabel.text = "Score: \(self.userData.score)"
            print(user)
            self.userDef.saveCoins(int: user.coin)
            self.userDef.saveName(name: user.user)
            self.userDef.saveScore(int: user.score)
            self.userDef.saveDocumentId(docID: user.documentId)
            
        }
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        getData()
    }
}
