//
//  DataProvider.swift
//  mongmongwoo
//
//  Created by 董南宏 on 2016/9/10.
//  Copyright © 2016年 kosbrother. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

typealias GetBannerResponse = ([Banner], NSError?) -> Void
typealias GetCategorySortItemsResponse = ([Item], NSError?) ->Void

class DataProvider: NSObject {
    
//    #if DEBUG
//        let BASE_URL = "http://104.199.129.36/"
//    #else
//        let BASE_URL = "https://www.mmwooo.com/"
//    #endif
    
    let BASE_URL = "http://104.199.129.36/"
    class var sharedInstance:DataProvider {
        struct Singleton {
            static let instance = DataProvider()
        }
        return Singleton.instance
    }
    
    func getBanners(onCompletion: GetBannerResponse) -> Void {
        let url = BASE_URL + "api/v4/banners"
        Alamofire.request(.GET, url)
            .responseJSON { response in
                if let JSON = response.result.value {
                    let response = Mapper<BannerResponse>().map(JSON)!
                    onCompletion(response.data!,nil)
                }
        }
    }
    
    func getCategorySortItems(categoryName:String, sortName:String,page:Int,onCompletion:GetCategorySortItemsResponse){
        var test = categoryName.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        let url = BASE_URL + "api/v3/categories/"+(test!)+"/items"+"?sort="+sortName+"&page="+String(page)
        print(url)
        Alamofire.request(.GET, url)
            .responseJSON { response in
                if let JSON = response.result.value {
                    let response = Mapper<ItemsResponse>().map(JSON)!
                    onCompletion(response.data!,nil)
                }
        }
    }
}