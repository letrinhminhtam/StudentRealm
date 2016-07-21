//
//  EditStudentViewController.swift
//  StudentRealm
//
//  Created by TamLTM on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

class EditStudentViewController: UIViewController {
    
    @IBOutlet weak private var schoolNameLabel: UILabel!
    @IBOutlet weak private var classNameLabel: UILabel!
    @IBOutlet weak private var noNumberLabel: UILabel!
    @IBOutlet weak private var imageView: UIImageView!

    var classStudent = Class()
    var students = Student()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureEditStudentVC()
        setUpUI()
        setUpData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: IBaction Button
    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func studentButton(sender: AnyObject) {
        let studentVC = StudentViewController()
        studentVC.classs.schoolName = classStudent.schoolName
        
        print("Name: \(students.studentName)")
        navigationController?.pushViewController(studentVC, animated:true)
    }
    
    @IBAction func deleteStudentButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK: Private
    private func configureEditStudentVC() {

    }
    
    //MARK: Set Up UI 
    private func setUpUI() {
      setTextLabel()
    }
    
    //MARK: Set Up Data
    private func setUpData() {
        
    }
    
    private func setTextLabel() {
        schoolNameLabel.text = NSString(format: "\(Strings.schoolName)%@", classStudent.schoolName) as String
        classNameLabel.text = NSString(format: "\(Strings.className)%@", classStudent.classRoom) as String
        noNumberLabel.text = NSString(format: "\(Strings.noNumber)%@", classStudent.numbers) as String
        if !classStudent.avatarImageView.isEmpty {
            imageView.image = FileManager.fileManager.loadFile(classStudent.avatarImageView, typeDirectory: .DocumentDirectory)
        }
    }
}
