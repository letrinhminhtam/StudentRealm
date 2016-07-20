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
        clickOpenCameraroll()
    }
    
    //MARK: set Up Data
    private func setUpData() {
        
    }
    
    private func clickOpenCameraroll() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loadImageButton(_:)))
        self.avatarImageView.addGestureRecognizer(gestureRecognizer)
        self.avatarImageView.userInteractionEnabled = true
    }

    @IBAction func backHomeViewVCButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        addClassStudent()
    }
    
    private func addClassStudent() {
        classStudent.schoolName = tfSchoolName.text!
        classStudent.classRoom = tfClassName.text!
        classStudent.numbers = tfNoNumber.text!
        if let imageView = avatarImageView.image {
            classStudent.avatarImageView = saveImageView(imageView)
        }
        print("image add: \(classStudent.avatarImageView)")
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(classStudent)
            }
        } catch {
            print("Catch")
        }
        navigationController?.popViewControllerAnimated(true)
    }
    
    private func saveImageView(imageView: UIImage) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy hh.mm.ss"
        let filename = "\(dateFormatter.stringFromDate(NSDate())).png"
        FileManager.fileManager.saveFile(imageView, name: filename, typeDirectory: .DocumentDirectory)
        print("Link: \(filename)")
        return filename
    }
}

extension AddClassStudentViewContrller: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func loadImageButton(sender: AnyObject) {
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
