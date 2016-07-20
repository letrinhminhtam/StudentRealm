//
//  HomViewController.swift
//  StudentRealm
//
//  Created by TamLTM on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeViewController()
        setUpUI()
        setUpData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Configure
    func configureHomeViewController() {
        tableView.registerNib(UINib(nibName: "HomeTableViewCell", bundle:  nil), forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: set Up UI
    func setUpUI() {
        
    }
    
    //MARK: set Up Data
    func setUpData() {
        
    }
    
    //MARK: IBActionButton
    @IBAction func addClassButton(sender: AnyObject) {
        let addClass = AddClassStudentViewContrller()
        navigationController?.pushViewController(addClass, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! HomeTableViewCell
        return homeCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let editStudentVC = EditStudentViewController()
        navigationController?.pushViewController(editStudentVC, animated: true)
    }
}