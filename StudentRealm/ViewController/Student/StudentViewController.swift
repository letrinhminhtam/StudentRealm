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
    
    var student: Results<Student>?
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
        studentList()
    }
    
    //MARK: Set Up UI
    private func setUpUI() {
    
    }
    
    private func studentList() {
        do {
            let realm = try Realm()
            student = realm.objects(Student)
        } catch {}
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
        return student!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let studentCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! StudentListTableViewCell
        studentCell.congiureStudentListCell(student![indexPath.row])
        return studentCell
    }
}
