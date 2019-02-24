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
    public var date: Date //НЕ ЗАБУДЬ СНЕСТИ
    public var description: String
    public var city:String
    public var dateStart:String
    public var dateEnd:String
    public var link:String
   
    public var preview:String
   
    
    init(date:Date,title: String,description: String,link: String,dateEnd: String,dateStart: String,city: String,preview:String) {
        self.title = title
        self.date=date
        self.description=description
        self.link=link
        self.dateEnd=dateEnd
        self.dateStart=dateStart
        self.city=city
        self.preview=preview
    }
}
/*class EventType {
    public var type:String
    enum {
        
        case Winter
        case Spring
        case Summer
        case Autumn
    }
}*/
