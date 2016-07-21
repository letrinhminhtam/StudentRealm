//
//  AddStudentViewController.swift
//  StudentRealm
//
//  Created by TamLTM on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

class AddStudentViewController: UIViewController {
    
    @IBOutlet weak private var tfLastName: UITextField!
    @IBOutlet weak private var tfAge: UITextField!
    @IBOutlet weak private var tfSex: UITextField!
    @IBOutlet weak private var tfClass: UITextField!

    var student = Student()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Button
    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        addStudent()
    }
    
    //MARK: configure
    private func configureAddStudentViewController() {
        
    }
    
    //MARK: Set Up UI
    private func setUpUI() {
        
    }
    
    //MARK: Set Up Data
    private func setUpData() {
        
    }
    
    private func addStudent() {
        student.studentName = tfLastName.text!
        student.age = tfAge.text!
        student.sex = tfSex.text!
        student.classRoom = tfClass.text!
        print("Student: \(student.studentName)")
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(student)
            }
        } catch {}
        navigationController?.popViewControllerAnimated(true)
    }
}
