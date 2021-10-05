//
//  PhoneNumberTableViewCell.swift
//  DemoPhoneNumberDelegate
//
//  Created by Võ Hoàng Long on 05/10/2021.
//

import UIKit

class PhoneNumberTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    var index = 0
    var delegate:CellPhoneNumberDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myTextField.delegate = self
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        delegate?.phoneNumberTextField(info: myTextField.text ?? "")

        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.phoneNumberTextField(info: myTextField.text ?? "",index: self.index)
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.phoneNumberTextField(info: myTextField.text ?? "",index: self.index)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
protocol CellPhoneNumberDelegate: AnyObject {
    func phoneNumberTextField(info: String,index: Int)


}
