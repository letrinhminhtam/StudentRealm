//
//  HomeTableViewCell.swift
//  StudentRealm
//
//  Created by Le Tam on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var schoolNameLabel: UILabel!
    @IBOutlet weak private var classNameLabel: UILabel!
    @IBOutlet weak private var noNumberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        setUpData()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .None
    }
    
    func configureCell(classStudent: Class) {
        schoolNameLabel.text = NSString(format: "\(Strings.schoolName)%@", classStudent.schoolName) as String
        classNameLabel.text = NSString(format: "\(Strings.className)%@", classStudent.classRoom) as String
        noNumberLabel.text = NSString(format: "\(Strings.noNumber)%@", classStudent.numbers) as String
    }
    
    func setUpUI() {
        
    }
    
    func setUpData() {
        
    }
}
