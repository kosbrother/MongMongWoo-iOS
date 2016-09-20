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
typealias GetNotificationsResponse = ([Notification], NSError?) ->Void

class DataProvider: NSObject {
    
    #if NDEBUG
    let BASE_URL = "https://www.mmwooo.com/"
    #else
    let BASE_URL = "http://104.199.129.36/"
    #endif
    
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
        let test = categoryName.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
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
    
    func getNotifications(userId:Int,onCompletion:GetNotificationsResponse){
        let url = BASE_URL + "api/v4/users/"+String(userId)+"/my_messages"
        print(url)
        Alamofire.request(.GET, url)
            .responseJSON { response in
                if let JSON = response.result.value {
                    let response = Mapper<NotificaionsResponse>().map(JSON)!
                    onCompletion(response.data!,nil)
                }
        }
    }
}
