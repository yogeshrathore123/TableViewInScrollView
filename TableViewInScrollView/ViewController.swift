//
//  ViewController.swift
//  TableViewInScrollView
//
//  Created by Yogesh Rathore on 10/01/24.
//

/*
 
 Problem: ViewControoler- View - 1 SubView(ScroolView) contains - 2 views (1 Uitableview height is not fixed (tableView  Should not scrool), 1 UIView height is fixed 200)
 
 */


import UIKit

class ViewController: UIViewController {
    
    // IBOutlet
    @IBOutlet weak var userInfoTableView: UITableView!
    
    @IBOutlet weak var userInfoTableViewHeightConstraint: NSLayoutConstraint!
    
    // Varaible
    var userInfo = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userInfo = ["Rohit Gurunath Sharma is an Indian international cricketer who currently plays and captains the India national cricket team across all formats.",
                    "Virat Kohli is an Indian international cricketer and the former captain of the Indian national cricket team. He currently represents Royal Challengers Bangalore in the IPL and Delhi in domestic cricket. Kohli is widely regarded as one of the greatest batsmen in the history of cricket, and the best of 21st century",
                    "Sachin Ramesh Tendulkar, is an Indian former international cricketer who captained the Indian national team. He is widely regarded as one of the greatest batsmen in the history of cricket",
                    "Shreyas Santosh Iyer is an Indian international cricketer who plays for the Indian cricket team as a right-handed batter. He has played in all formats for the Indian team.",
                    "Virender Sehwag is a former Indian cricketer who represented India from 1999 to 2013. Widely regarded as one of the most destructive openers and one of the greatest batsman of his era, he played for Delhi Capitals in IPL and Delhi and Haryana in Indian domestic cricket.",
                    "Yuvraj Singh is a former Indian international cricketer who played in all formats of the game.",
                    "Gautam Gambhir is an Indian former international cricketer",
                    "Ravindra Jadja",
                    "Sourav Chandidas Ganguly, also known as Dada, is an Indian cricket commentator and former cricketer. "]
    }
    
    func sharedKeyChainData() {
        let keychain = keychainwr
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.userInfoTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        self.userInfoTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let newValue = change?[.newKey] {
                let newSize = newValue as! CGSize
                self.userInfoTableViewHeightConstraint.constant = newSize.height
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userInfo.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as? UserInfoTableViewCell {
            
            cell.userInfoLabel.text = userInfo[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

