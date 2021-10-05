//
//  ViewController.swift
//  DemoPhoneNumberDelegate
//
//  Created by Võ Hoàng Long on 05/10/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var nameArray = ["Lúa", "Khoai", "Sắn", "Mỳ"]
    
    var array = ["", "", "", ""]
    var phoneNumber = ""
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PhoneNumberTableViewCell", bundle: nil), forCellReuseIdentifier: "PhoneNumberTableViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return nameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneNumberTableViewCell") as! PhoneNumberTableViewCell
        cell.myLabel.text = nameArray[indexPath.row]
        cell.index = indexPath.row
        cell.myTextField.text = array[index]
        cell.delegate = self

        return cell
    }

    @IBAction func saveButton(_ sender: UIButton) {
        
        self.array.forEach { text in
            print(text)
        }
    }
    
}
extension ViewController: CellPhoneNumberDelegate {
//    func linePhoneNumberTextField(index: Int) {
//        self.index = index
//    }
    
    func phoneNumberTextField(info: String,index:Int) {
//        phoneNumber = info
        self.array[index] = info
    }
    
}

