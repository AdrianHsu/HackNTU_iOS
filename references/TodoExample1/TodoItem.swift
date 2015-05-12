//
//  TodoItem.swift
//  TodoExample1
//
//  Created by 張 景隆 on 2015/4/13.
//  Copyright (c) 2015年 張 景隆. All rights reserved.
//

import Foundation
import CoreData

@objc(TodoItem)
class TodoItem: NSManagedObject {

    @NSManaged var name: String

}
