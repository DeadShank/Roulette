//
//  ViewController.swift
//  Roulette
//
//  Created by Alex on 04.08.2022.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class LoginVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()

    
    
    var userData = UserModel()
    
    func fireBase() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func getData() {
        let userRef = db.collection("usersData").whereField("user", isEqualTo: nameTF.text ?? "")
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
                                       "password": passTF.text ?? ""]
        let document = db.collection("usersData").document()
        document.setData(docData)
        userData.documentId = document.documentID
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        getData()
        if nameTF.text == userData.user {
            let myStoryBoard = UIStoryboard.init(name: "GameStoryboard", bundle: nil)
            let vc = myStoryBoard.instantiateViewController(withIdentifier: "GameVC") as! GameVC
            vc.userData = userData
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        } else {
            print(userData)
        }
    }
}


