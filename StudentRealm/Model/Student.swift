//
//  Student.swift
//  StudentRealm
//
//  Created by Le Tam on 7/19/16.
//  Copyright © 2016 Asiantech. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class Student: Object {
   dynamic var studentName = ""
   dynamic var age = ""
   dynamic var sex = ""
   dynamic var classRoom = ""
}
