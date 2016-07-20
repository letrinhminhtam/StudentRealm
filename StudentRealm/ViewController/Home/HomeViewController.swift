//
//  HomViewController.swift
//  StudentRealm
//
//  Created by TamLTM on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!

    var results: Results<Class>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeViewController()
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
    
    //MARK: Configure
    func configureHomeViewController() {
        tableView.registerNib(UINib(nibName: "HomeTableViewCell", bundle:  nil), forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: set Up UI
    private func setUpUI() {
        
    }
    
    //MARK: set Up Data
    private func setUpData() {
        reloadDataTableViewInReaml()
    }
    
    private func reloadDataTableViewInReaml() {
        do {
            let realm = try Realm()
            results = realm.objects(Class)
        } catch {}

    }
    
    //MARK: IBActionButton
    @IBAction func addClassButton(sender: AnyObject) {
        let addClass = AddClassStudentViewContrller()
        navigationController?.pushViewController(addClass, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count: \(results!.count)")
        return results!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! HomeTableViewCell
        homeCell.configureCell(results![indexPath.row])
        return homeCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let editStudentVC = EditStudentViewController()
        editStudentVC.classStudent = results![indexPath.row] 
        print("Edit: \(editStudentVC.classStudent)")
        navigationController?.pushViewController(editStudentVC, animated: true)
    }
}