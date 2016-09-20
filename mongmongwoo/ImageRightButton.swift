//
//  ImageRightButton.swift
//  mongmongwoo
//
//  Created by 董南宏 on 2016/9/20.
//  Copyright © 2016年 kosbrother. All rights reserved.
//

import UIKit

class ImageRightButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        transform = CGAffineTransformMakeScale(-1.0, 1.0);
        titleLabel!.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        imageView!.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        layer.cornerRadius = 2
    }

}
