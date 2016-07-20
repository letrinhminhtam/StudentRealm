//
//  HomeTableViewCell.swift
//  StudentRealm
//
//  Created by Le Tam on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        setUpData()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .None
    }
    
    func configureCell() {
        
    }
    
    func setUpUI() {
        
    }
    
    func setUpData() {
        
    }
}
