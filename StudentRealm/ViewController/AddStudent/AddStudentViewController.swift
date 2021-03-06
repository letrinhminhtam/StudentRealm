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

    var students = Student()
    var classs = Class()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddStudentViewController()
        setUpUI()
        setUpData()
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
       tfClass.text = classs.classRoom
        print(tfClass.text)
    }
    
    private func addStudent() {
        students.studentName = tfLastName.text!
        students.age = tfAge.text!
        students.sex = tfSex.text!
        students.classRoom = classs.classRoom
        print("Student: \(students.studentName)")
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(students)
            }
        } catch {}
        navigationController?.popViewControllerAnimated(true)
    }
}
