//
//  AccountVC.swift
//  Roulette
//
//  Created by Alex on 26.08.2022.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class AccountVC: UIViewController {
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    var userData = UserModel()
    var userDef = MyUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        propElem()
    }
    
    func propElem() {
        logoutButton.clipsToBounds = true
        logoutButton.layer.cornerRadius = 10
        
        deleteButton.clipsToBounds = true
        deleteButton.layer.cornerRadius = 10
    }
    
    func deleteUserDef() {
        userDef.saveName(name: "")
        userDef.saveCoins(int: 0)
        userDef.saveScore(int: 0)
        userDef.saveDocumentId(docID: "")
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        deleteUserDef()
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        db.collection("usersData").document(userDef.getDocID()).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
        deleteUserDef()
    }
}
