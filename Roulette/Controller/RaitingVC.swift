//
//  SeetingsVC.swift
//  Roulette
//
//  Created by Alex on 07.08.2022.
//
import UIKit
import FirebaseCore
import FirebaseFirestore

class RaitingVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var usersData: [UserModel] = []
    var sortedData : [UserModel] = []
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        getData()
    }
    
    func getData() {
        let userRef = db.collection("usersData")
        userRef.getDocuments() { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let documents = snapshot?.documents, !documents.isEmpty else { return }
            
            var users: [UserModel] = []
            for document in documents {
                let data = document.data()
                let user = UserModel(user: data["user"] as? String ?? "",
                                     password: data["password"] as? String ?? "",
                                     coin: data["coin"] as? Int ?? 0,
                                     score: data["score"] as? Int ?? 0)
                users.append(user)
            }
            self.usersData += users.sorted(by: {$0.score > $1.score } )
            print(self.usersData)
            self.tableView.reloadData()
        }
    }
    
    func createTable() {
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension RaitingVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return usersData.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.scoreLabel.text = "Score: \(usersData[indexPath.row].score)"
        cell.coinLabel.text = "Coins: \(usersData[indexPath.row].coin)"
        cell.nameLabel.text = "User: \(usersData[indexPath.row].user)"
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
