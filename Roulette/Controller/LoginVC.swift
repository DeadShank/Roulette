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
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        userData.user = nameTF.text ?? ""
        userData.coin = 2000
        userData.score = 0
        userData.password = passTF.text ?? ""

        let docData: [String : Any] = ["user": nameTF.text ?? "",
                                       "coin": 2000,
                                       "score": 0,
                                       "password": passTF.text ?? ""]
        db.collection("usersData").document().setData(docData)
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        let myStoryBoard = UIStoryboard.init(name: "GameStoryboard", bundle: nil)
        let vc = myStoryBoard.instantiateViewController(withIdentifier: "GameVC") as! GameVC
        vc.userData = userData
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}


