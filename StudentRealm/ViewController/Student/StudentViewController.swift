//
//  StudentViewController.swift
//  StudentRealm
//
//  Created by TamLTM on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func addStudentButton(sender: AnyObject) {
        let addStudentVC = AddStudentViewController()
        navigationController?.pushViewController(addStudentVC, animated: true)
    }
}
