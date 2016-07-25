//
//  StudentViewController.swift
//  StudentRealm
//
//  Created by TamLTM on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

class StudentViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var nameLabel: UILabel!
    
    var students: Results<Student>!
    var showStudent = Student()
    var classs = Class()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureStudentViewController()
        setUpUI()
        setUpData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func addStudentButton(sender: AnyObject) {
        let addStudentVC = AddStudentViewController()
        addStudentVC.classs = classs
        navigationController?.pushViewController(addStudentVC, animated: true)
    }
    
    //MARK: Config
    private func configureStudentViewController() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "StudentListTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    //MARK: Set Up Data
    private func setUpData() {
        nameLabel.text = classs.classRoom
        print(nameLabel.text)
        students = uiRealm.objects(Student).filter("classRoom = %@", classs.classRoom)
    }
    
    //MARK: Set Up UI
    private func setUpUI() {
    
    }
}

extension StudentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let studentCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! StudentListTableViewCell
        studentCell.configureStudentListCell(students![indexPath.row])
        studentCell.configureSetText(classs)
        return studentCell
    }
}
