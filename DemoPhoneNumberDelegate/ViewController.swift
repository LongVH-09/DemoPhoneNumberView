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
    
    var phoneNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PhoneNumberTableViewCell", bundle: nil), forCellReuseIdentifier: "PhoneNumberTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return nameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneNumberTableViewCell") as! PhoneNumberTableViewCell
        cell.myLabel.text = nameArray[indexPath.row]
        cell.index = indexPath.row
        cell.delegate = self

        return cell
    }

    @IBAction func saveButton(_ sender: UIButton) {
        print(phoneNumber)
    }
    
}
extension ViewController: CellPhoneNumberDelegate {
    func phoneNumberTextField(info: String) {
        phoneNumber = info
    }
    
}

