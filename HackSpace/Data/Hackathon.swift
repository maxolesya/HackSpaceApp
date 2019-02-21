//
//  Hackathon.swift
//  HackSpace
//
//  Created by Олеся Максакова on 21.02.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import Foundation

class Hackathon {
    public var title:String
    public var date: Date
    public var description: String
    
    init(date:Date,title: String,description: String) {
        self.title = title
        self.date=date
        self.description=description
       
        
    }
}
