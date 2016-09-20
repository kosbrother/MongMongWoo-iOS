//
//  ItemsResponse.swift
//  mongmongwoo
//
//  Created by 董南宏 on 2016/9/10.
//  Copyright © 2016年 kosbrother. All rights reserved.
//

import ObjectMapper

class ItemsResponse: Mappable {
    var data: [Item]?
    var error: Error?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
        error <- map["error"]
    }
}

class Item: Mappable {
    var id: Int?
    var name: String?
    var price: Int?
    var slug: String?
    var status: String?
    var description: String?
    var cover: Cover?
    var specialPrice: Int?
    var specs: [Spec]?
    var photos: [Photo]?
    var finalPrice: Int?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        price <- map["price"]
        slug <- map["slug"]
        status <- map["status"]
        description <- map["description"]
        cover <- map["cover"]
        specialPrice <- map["special_price"]
        specs <- map["specs"]
        photos <- map["photos"]
        finalPrice <- map["final_price"]
    }
    
    func getFinalPriceText() -> String {
        return "NT$ \(finalPrice!)"
    }
    
    func getOriginPriceText() -> String {
        if specialPrice==nil||specialPrice==0 {
            return " "
        }
        return "原價NT$ \(price!)"
    }
    
    func isSpecialPriceItem() -> Bool {
        if specialPrice==nil||specialPrice==0 {
            return false
        }
        return true
    }
}

class Cover: Mappable {
    var url: String?
    var icon: Icon?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        icon <- map["icon"]
    }
}

class Icon: Mappable {
    var url: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
    }
}

class Spec: Mappable {
    var id: Int?
    var style: String?
    var stylePic: StylePic?
    var stockAmount: Int?
    var status: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["url"]
        style <- map["style"]
        stylePic <- map["stylePic"]
        stockAmount <- map["stockAmount"]
        status <- map["status"]
        
    }
}

class StylePic: Mappable {
    var url: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
    }
}

class Photo: Mappable {
    var image: Image?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        image <- map["image"]
    }
}


