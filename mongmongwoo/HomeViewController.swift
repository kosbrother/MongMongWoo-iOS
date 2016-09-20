//
//  FirstViewController.swift
//  mongmongwoo
//
//  Created by 董南宏 on 2016/8/31.
//  Copyright © 2016年 kosbrother. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var itemCollectionView: UICollectionView!
    var headerView : HomeHeaderCollectionReusableView!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var popularItems = [Item]()
    var newItems = [Item]()
    var displayItems = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view, typically from a nib.
        DataProvider.sharedInstance.getCategorySortItems("所有商品", sortName: "popular", page: 1){ (response:[Item],error:NSError?) in
            self.popularItems.removeAll()
            for item in response{
                self.popularItems.append(item)
            }
        }
        
        DataProvider.sharedInstance.getCategorySortItems("新品上架", sortName: "popular", page: 1){ (response:[Item],error:NSError?) in
            self.newItems.removeAll()
            for item in response {
                self.newItems.append(item)
            }
            
            self.displayItems.removeAll()
            for item in self.newItems {
                self.displayItems.append(item)
            }
            self.itemCollectionView.reloadData()
        }
        
        itemCollectionView.backgroundColor = UIColor.whiteColor()
        let flow = itemCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsetsMake(0, 8, 0,8)
        let width = UIScreen.mainScreen().bounds.size.width-24
        flow.itemSize.width = width*0.5
//        flow.itemSize.height = itemCollectionView.collectionViewLayout.collectionViewContentSize().height 
        flow.minimumInteritemSpacing = 8
        flow.minimumLineSpacing = 8
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.displayItems.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ItemCollectionViewCell
        
        cell.layer.borderColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1).CGColor
        cell.layer.borderWidth = 1;
        cell.layer.contentsScale = UIScreen.mainScreen().scale;
        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).CGColor
        cell.layer.shadowOpacity = 1;
        cell.layer.shadowRadius = 2.1;
        cell.layer.shadowOffset = CGSize(width: 1,height: 1);
        cell.layer.shadowPath =  UIBezierPath(rect: cell.bounds).CGPath
        cell.layer.shouldRasterize = true
        
        let item = self.displayItems[indexPath.item]
        cell.nameLabel.text = item.name
        cell.originalPriceLabel.text = item.getOriginPriceText()
        cell.finalPriceLabel.text = item.getFinalPriceText()
        cell.itemImageView.imageFromUrl(item.cover!.url!)
        cell.specialItemImageView.hidden = !item.isSpecialPriceItem()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                                                          atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            headerView =
                collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                                                                      withReuseIdentifier: "HomeHeaderCollectionReusableView",
                                                                      forIndexPath: indexPath)
                    as! HomeHeaderCollectionReusableView
            
            DataProvider.sharedInstance.getBanners(){ (responseObject:[Banner], error:NSError?) in
                let banner = responseObject[0]
                self.headerView.bannerImageView.imageFromUrl(banner.image!.url!)
                self.headerView.bannerImageView.contentMode = .ScaleToFill
            }
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

    // MARK: Actions
    
    @IBAction func displayPopularItems(sender: UIButton) {
        headerView.newItemsLabel.backgroundColor = UIColor.whiteColor()
        headerView.newItemsLabel.textColor = UIColor(red: 0/255.0, green: 163/255.0,blue: 120/255.0,alpha: 1)
        headerView.popularItemsLabel.backgroundColor = UIColor(red: 0/255.0, green: 163/255.0,blue: 120/255.0,alpha: 1)
        headerView.popularItemsLabel.textColor = UIColor.whiteColor()
        self.displayItems.removeAll()
        for item in self.popularItems {
            self.displayItems.append(item)
        }
        self.itemCollectionView.reloadData()
    }
    
    @IBAction func displayNewItems(sender: UIButton) {
        headerView.newItemsLabel.backgroundColor = UIColor(red: 0/255.0, green: 163/255.0,blue: 120/255.0,alpha: 1)
        headerView.newItemsLabel.textColor = UIColor.whiteColor()
        headerView.popularItemsLabel.backgroundColor = UIColor.whiteColor()
        headerView.popularItemsLabel.textColor = UIColor(red: 0/255.0, green: 163/255.0,blue: 120/255.0,alpha: 1)
        self.displayItems.removeAll()
        for item in self.newItems {
            self.displayItems.append(item)
        }
        self.itemCollectionView.reloadData()
    }
}

