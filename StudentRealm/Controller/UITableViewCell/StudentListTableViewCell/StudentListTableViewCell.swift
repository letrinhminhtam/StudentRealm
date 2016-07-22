//
//  StudentListTableViewCell.swift
//  StudentRealm
//
//  Created by Le Tam on 7/21/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit

class StudentListTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var lastNameLabel: UILabel!
    @IBOutlet weak private var ageLabel: UILabel!
    @IBOutlet weak private var sexLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func congiureStudentListCell(student: Student) {
        lastNameLabel.text = NSString(format: "\(Strings.lastName)%@", student.studentName) as String
        ageLabel.text = NSString(format: "\(Strings.age)%@", student.age) as String
        sexLabel.text = NSString(format: "\(Strings.sex)%@", student.sex) as String
       // classLabel.text = NSString(format: "\(Strings.classRoom)%@", student.classRoom) as String
    }
}
	