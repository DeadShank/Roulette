//
//  ViewController.swift
//  Roulette
//
//  Created by Alex on 04.08.2022.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class RegisterVC: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    var userData = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        propElem()
    }
    
    func propElem() {
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 10
        
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 10
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func saveInBaseData() {
        let washingtonRef = db.collection("usersData").document(userData.documentId)
        washingtonRef.updateData([
            "documentId": userData.documentId
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        userData.user = nameTF.text ?? ""
        userData.coin = 2000
        userData.score = 0
        userData.password = passTF.text ?? ""

        let docData: [String : Any] = ["user": nameTF.text ?? "",
                                       "coin": 2000,
                                       "score": 0,
                                       "password": passTF.text ?? "",
                                       "documentId": ""]
        let document = db.collection("usersData").document()
        document.setData(docData)
        userData.documentId = document.documentID
        saveInBaseData()
        print(docData)
        print(userData)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}


