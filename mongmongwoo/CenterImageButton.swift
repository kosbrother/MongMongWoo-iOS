//
//  CenterImageButton.swift
//  mongmongwoo
//
//  Created by 董南宏 on 2016/9/19.
//  Copyright © 2016年 kosbrother. All rights reserved.
//

import UIKit

class CenterImageButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var frame = imageView!.frame;
        frame = CGRectMake((bounds.size.width - frame.size.width) / 2, 0, frame.size.width, frame.size.height);
        imageView!.frame = frame;
        
        frame = titleLabel!.frame;
        frame = CGRectMake((bounds.size.width - frame.size.width) / 2, bounds.size.height - frame.size.height, frame.size.width, frame.size.height);
        titleLabel!.frame = frame;
    }

}
