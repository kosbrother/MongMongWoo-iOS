//
//  NotificationsResponse.swift
//  mongmongwoo
//
//  Created by 董南宏 on 2016/9/19.
//  Copyright © 2016年 kosbrother. All rights reserved.
//

import ObjectMapper

class NotificaionsResponse: Mappable {
    var data: [Notification]?
    var error: Error?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
        error <- map["error"]
    }
}

class Notification: Mappable {
    var id: Int?
    var messageType: String?
    var title: String?
    var content: String?
    var createdAt: String?
    var appIndexUrl: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        messageType <- map["message_type"]
        title <- map["title"]
        content <- map["content"]
        createdAt <- map["created_at"]
        appIndexUrl <- map["app_index_url"]
    }
}

