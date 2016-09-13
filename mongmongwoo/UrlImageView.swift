//
//  UrlImageView.swift
//  mongmongwoo
//
//  Created by 董南宏 on 2016/9/9.
//  Copyright © 2016年 kosbrother. All rights reserved.
//

import Foundation
import UIKit

class UrlImageView: UIImageView {
    
    internal func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    internal func imageFromBannerUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                    let screenSize: CGRect = UIScreen.mainScreen().bounds
                    self.contentMode = UIViewContentMode.ScaleAspectFit
                    self.frame = CGRectMake(0,0, screenSize.width, screenSize.width*0.35)
                }
            }
        }
    }

}