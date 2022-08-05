//
//  ViewController.swift
//  Roulette
//
//  Created by Alex on 04.08.2022.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    
    
    var userData = UserModel()

    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBAction func saveButton(_ sender: UIButton) {
        userData.user = nameTF.text ?? ""
        userData.coin = 2000
        userData.score = 0
        print(userData)
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        let myStoryBoard = UIStoryboard.init(name: "GameStoryboard", bundle: nil)
        let vc = myStoryBoard.instantiateViewController(withIdentifier: "GameVC") as! GameVC
        vc.userData = userData
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        print("perehod na GameVC")
    }
    
}


