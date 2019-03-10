//
//  Hackathon.swift
//  HackSpace
//
//  Created by Олеся Максакова on 21.02.2019.
//  Copyright © 2019 HSEProject. All rights reserved.
//

import Foundation



class Hackathon:Decodable {
    public var id: Int
    public var title:String
    public var submissionDue: String?
    //public var description: String?
    public var city:String?
    public var dateStart:String?
    public var dateEnd:String?
    public var link:String?
    public var eventType:String?
    public var preview:String?
   
   /* public enum status{
        
        case open
        case applied
        case confirmed
        case verified
        case activated
        case participated
        case won
    }*/
    public var status:String?
    public var isSearchable:Bool?
    public var organization: Organization
    
    init(title: String,/*description: String,*/link: String,dateEnd: String,dateStart: String,city: String,preview:String,organization: Organization,
         eventType:String,id:Int,status:String, isSearchable:Bool,submissionDue: String) {
        self.title = title
       self.id = id
        self.status = status
        //self.description=description
        self.link=link
        self.dateEnd=dateEnd
        self.dateStart=dateStart
        self.city=city
        self.preview=preview
        self.isSearchable = isSearchable
        self.submissionDue = submissionDue
       
        self.organization = organization
        self.eventType = eventType
        
    }
}
class Owner:Decodable {
     public var title:String
    public var logoUrl:String?
    public var link:String?
    init(title:String,logoUrl:String,link:String) {
        self.title = title
        self.logoUrl = logoUrl
        self.link = link
    }
}
class Gallery: Decodable {
    public var title:String
    public var url:String
    init(title:String,url:String) {
        self.title = title
        self.url = url
    }
}
class Prize: Decodable {
    public var type:String
    public var value:String
    init(type:String,value:String) {
        self.type = type
        self.value = value
    }
}
class Skill:Decodable{
    public var id: Int
    public var tag:String
    init(id:Int,tag:String) {
        self.id = id
        self.tag = tag
    }
}
class Challenge: Decodable {
    public var id: Int
    public var title:String
    public var description: String?
    public var participants: Int
    public var owners: [Owner]
    init(id:Int,title:String,desc:String,part:Int,owners:[Owner]) {
        self.id = id
        self.title = title
        self.description = desc
        self.participants = part
        self.owners = owners
    }
}
class Schedule:Decodable  {
    public var description:String?
    public var time:String?
    init(description:String,time:String) {
        self.description = description
        self.time = time
    }
}

/*class HackInfo: Hackathon,Decodable {
    
    init(<#parameters#>) {
        <#statements#>
    }
}*/

