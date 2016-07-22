//
//  Class.swift
//  StudentRealm
//
//  Created by Le Tam on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class Class: Object {
    dynamic var schoolName = " "
    dynamic var numbers = " "
    dynamic var classRoom = " "
    dynamic var avatarImageView = " "
     var studentInClass: List<Student>!
}		
