//
//  EditStudentViewController.swift
//  StudentRealm
//
//  Created by TamLTM on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit

class EditStudentViewController: UIViewController {

    var classStudent = Class()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func studentButton(sender: AnyObject) {
        let studentVC = StudentViewController()
        navigationController?.pushViewController(studentVC, animated:true)
    }
    
    @IBAction func deleteStudentButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
