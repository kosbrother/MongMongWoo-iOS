//
//  ItemCollectionViewCell.swift
//  mongmongwoo
//
//  Created by 董南宏 on 2016/9/12.
//  Copyright © 2016年 kosbrother. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemImageView: UrlImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var finalPriceLabel: UILabel!
    @IBOutlet weak var specialItemImageView: UIImageView!
    @IBOutlet weak var addToCartButton: UIButton!
}
