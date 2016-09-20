//
//  LoginBorderButton.swift
//  mongmongwoo
//
//  Created by 董南宏 on 2016/9/19.
//  Copyright © 2016年 kosbrother. All rights reserved.
//

import UIKit

class LoginBorderButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.borderWidth = 1
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.cornerRadius = 2.5
    }
}
