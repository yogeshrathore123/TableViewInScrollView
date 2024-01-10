//
//  KeyChainViewController.swift
//  TableViewInScrollView
//
//  Created by Yogesh Rathore on 10/01/24.
//

import UIKit
import KeychainSwift


/*
 
 //MARK: Sharing keychain items with other apps
 In order to share keychain items between apps on the same device they need to have common Keychain Groups registered in Capabilities > Keychain Sharing settings. This Demo code shows how to set it up.
 
 Use accessGroup property to access shared keychain items. In the following example we specify an access group "DS671JRA62.com.myapp.KeychainGroup" that will be used to set, get and delete an item "nameKey".
 
 let keychain = KeychainSwift()
 keychain.accessGroup = "DS671JRA62.com.myapp.KeychainGroup" // Use your own access goup this is dummy accessGroup
 
 keychain.set("Yogesh Rathore", forKey: "nameKey")
 keychain.get("nameKey")
 keychain.delete("nameKey")
 keychain.clear()
 
 */

class KeyChainViewController: UIViewController {
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    let nameKeychain = "nameKey"
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        fetchValueFromKeyChain()
    }
    
    private func fetchValueFromKeyChain() {
        keychain.synchronizable = true
        if let nameValue = keychain.get(nameKeychain) {
            valueLabel.text = "In Keychain: \(nameValue)"
            nameTextField.text = nameValue
        } else {
            valueLabel.text = "no value saved in keychain"
        }
    }
    
    
    @IBAction func saveButtonDidTap(_ sender: Any) {
        nameTextField.resignFirstResponder()
        
        if let text = nameTextField.text?.trimmingCharacters(in: .whitespaces), text.isEmpty == false {
            keychain.synchronizable = true
            keychain.set(text, forKey: nameKeychain)
            fetchValueFromKeyChain()
        } else {
            let alert = UIAlertController(title: "Error", message: "Please enter your name", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okButton)
            present(alert, animated: true)
        }
    }
    
    @IBAction func deleteButtonDidTap(_ sender: Any) {
        nameTextField.resignFirstResponder()
        nameTextField.text = ""
        keychain.synchronizable = true
        keychain.delete(nameKeychain)
        keychain.clear()
        fetchValueFromKeyChain()
        
    }
    
    
}
