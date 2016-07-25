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
    
    @IBOutlet weak private var tfSchoolName: UITextField!
    @IBOutlet weak private var tfClassName: UITextField!
    @IBOutlet weak private var tfNoNumber: UITextField!
    @IBOutlet weak private var imageView: UIImageView!

    var classStudent = Class()
    var students = Student()
    var results: Results<Class>?
    
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
        studentVC.classs = classStudent
        navigationController?.pushViewController(studentVC, animated:true)
    }
    
    @IBAction func deleteStudentButton(sender: AnyObject) {
        self.deleteClass()
    }
    
    //MARK: Private
    private func configureEditStudentVC() {

    }
    
    //MARK: Set Up UI 
    private func setUpUI() {
      setTextField()
    }
    
    //MARK: Set Up Data
    private func setUpData() {
        
    }
    
    private func setTextField() {
        tfSchoolName.text = classStudent.schoolName
        tfClassName.text = classStudent.classRoom
        tfNoNumber.text = classStudent.numbers
        if !classStudent.avatarImageView.isEmpty {
            imageView.image = FileManager.fileManager.loadFile(classStudent.avatarImageView, typeDirectory: .DocumentDirectory)
        }
    }
    
    //MARK: AlertViewController
    private func deleteClass() {
        let deleteClass = UIAlertController(title: "Warning", message: Strings.delete, preferredStyle: .Alert)
        deleteClass.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            do {
                let realm = try Realm()
                try realm.write ({ () -> Void in
                    if !self.classStudent.avatarImageView.isEmpty {
                        FileManager.fileManager.deleteFile(self.classStudent.avatarImageView, typeDirectory: NSSearchPathDirectory.DocumentDirectory)
                    }
                    realm.delete(self.classStudent)
                })
            } catch { }
            self.navigationController?.popViewControllerAnimated(true)
        }))
        deleteClass.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        presentViewController(deleteClass, animated: true, completion: nil)
    }
}
