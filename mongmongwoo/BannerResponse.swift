//
//  BannerResponse.swift
//  mongmongwoo
//
//  Created by 董南宏 on 2016/9/8.
//  Copyright © 2016年 kosbrother. All rights reserved.
//

import ObjectMapper

class BannerResponse: Mappable {
    var data: [Banner]?
    var error: Error?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
        error <- map["error"]
    }
    
}

class Banner: Mappable{
    var id: Int?
    var bannerable_id: Int?
    var bannerable_type: String?
    var title: String?
    var image: Image?
    var appIndexUrl: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        bannerable_id <- map["bannerable_id"]
        bannerable_type <- map["bannerable_type"]
        title <- map["type"]
        image <- map["image"]
        appIndexUrl <- map["app_index_url"]
    }
    
}

class Image: Mappable {
    var url: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
    }
}