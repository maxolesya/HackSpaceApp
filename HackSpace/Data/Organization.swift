//
//  Organization.swift
//  HackSpace
//
//  Created by Олеся Максакова on 03.03.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import Foundation
class Organization {
    public var id: Int
    public var title:String
    public var website:String
    
    init(id: Int, title: String,website: String) {
        self.id = id
        self.title = title
        self.website = website
    }
}
