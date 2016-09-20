//
//  BottomShadowView.swift
//  mongmongwoo
//
//  Created by 董南宏 on 2016/9/19.
//  Copyright © 2016年 kosbrother. All rights reserved.
//

import UIKit

class BottomShadowView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.masksToBounds = false;
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).CGColor
        self.layer.shadowOffset = CGSizeMake(0, 1);
        self.layer.shadowRadius = 0;
        self.layer.shadowOpacity = 0.5;
    }
}
