//
//  AddClassStudentViewContrller.swift
//  StudentRealm
//
//  Created by TamLTM on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit

class AddClassStudentViewContrller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: set Up UI
    func setUpUI() {
        
    }
    
    //MARK: set Up Data
    func setUpData() {
        
    }

    @IBAction func backHomeViewVCButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
