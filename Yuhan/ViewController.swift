//
//  ViewController.swift
//  Yuhan
//
//  Created by Maho Misumi on 2017/09/22.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

extension UIColor{
    class func LightBlue() -> UIColor{
        return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    }
    class func LightRed() -> UIColor{
        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    


    
    
    let dateManager = DateManager()
    let daysPerWeek: Int = 7
    let cellMargin: CGFloat = 2.0
    var selectedDate = NSDate()
    var today: NSDate!
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    @IBOutlet weak var headerPrevBtn: UIButton! //①
    @IBOutlet weak var headerNextBtn: UIButton! //②
    @IBOutlet weak var headerTitle: UILabel! //③
    @IBOutlet weak var calenderHeaderView: UIView! //①
    @IBOutlet weak var calenderCollectionView: UICollectionView! //①
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        calenderCollectionView.delegate = self
        calenderCollectionView.dataSource = self
        calenderCollectionView.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    //2
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Secrtion毎にCellの総数を変える
        if section == 0 {
            return 7
        } else {
            return dateManager.daysAcquisition() //ここは月によって異なる
        }
    }
    //3
    func collectionOfSectionsInCollectionview(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIndentifier("cell", forIndexPath: IndexPath) as! CalenderCell
        
        return cell
    }
    
    //①タップ時
    @IBAction func tappedHeaderPrevBtn(sender: UIButton){
    }
    //②タップ時
    @IBAction func tappedHeatherNextBtv(sender: UIButton){
    }

    
    if (indexPath.row % 7 == 0) {
      cell.textLabel.textColor = UIColor.lightRed()
    } else if (indexPath.row % 7 == 6) {
      cell.textLabel.textColor = UIColor.lightBlue()
    }  else {
     cell.textLabel.textColor = UIColor.grayColor()
    }
    //テキスト配置
    if indexPath.section ==  0  {
    cell.textLabel.text = weekArray[IndexPath.row]
    
    }
    
    
   
}

