//
//  Hackathon.swift
//  HackSpace
//
//  Created by Олеся Максакова on 21.02.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import Foundation

class Hackathon {
    public var id: Int
    public var title:String
    public var submissionDue: String
    public var description: String
    public var city:String
    public var dateStart:String
    public var dateEnd:String
    public var link:String
    public var eventType:String
    public var preview:String
    public var schedule:String
   /* public enum status{
        
        case open
        case applied
        case confirmed
        case verified
        case activated
        case participated
        case won
    }*/
    public var status:String
    public var isSearchable:Bool
    public var organization: Organization
    
    init(title: String,description: String,link: String,dateEnd: String,dateStart: String,city: String,preview:String,organization: Organization, schedule:String,
         eventType:String,id:Int,status:String, isSearchable:Bool,submissionDue: String) {
        self.title = title
       self.id = id
        self.status = status
        self.description=description
        self.link=link
        self.dateEnd=dateEnd
        self.dateStart=dateStart
        self.city=city
        self.preview=preview
        self.isSearchable = isSearchable
        self.submissionDue = submissionDue
        self.schedule = schedule
        self.organization = organization
        self.eventType = eventType
        
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
