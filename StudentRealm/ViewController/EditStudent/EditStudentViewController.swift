//
//  EditStudentViewController.swift
//  StudentRealm
//
//  Created by TamLTM on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit

class EditStudentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
