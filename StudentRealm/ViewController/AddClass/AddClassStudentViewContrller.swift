//
//  AddClassStudentViewContrller.swift
//  StudentRealm
//
//  Created by TamLTM on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

class AddClassStudentViewContrller: UIViewController {
    
    @IBOutlet weak private var tfSchoolName: UITextField!
    @IBOutlet weak private var tfClassName: UITextField!
    @IBOutlet weak private var tfNoNumber: UITextField!
    @IBOutlet weak private var avatarImageView: UIImageView!

    var classStudent = Class()
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddClassStudentVC()
        setUpUI()
        setUpData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureAddClassStudentVC() {
        
    }
    
    //MARK: set Up UI
    private func setUpUI() {
        imagePicker.delegate = self
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(loadImageButton()))
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    //MARK: set Up Data
    private func setUpData() {
        
    }

    @IBAction func backHomeViewVCButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        addClassStudent()
        navigationController?.popViewControllerAnimated(true)
    }
    
    private func addClassStudent() {
        classStudent.schoolName = tfSchoolName.text!
        classStudent.classRoom = tfClassName.text!
        classStudent.numbers = tfNoNumber.text!
        avatarImageView.image = UIImage(named: classStudent.avatarImageView)
        print("du lieu: \(classStudent.classRoom)")
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(classStudent)
            }
        } catch {
            print("Catch")
        }
    }
}

extension AddClassStudentViewContrller: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func loadImageButton() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            avatarImageView.contentMode = .ScaleAspectFit
            avatarImageView.image = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
