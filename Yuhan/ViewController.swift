//
//  ViewController.swift
//  Yuhan
//
//  Created by Maho Misumi on 2017/09/22.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    <#code#>
//}
import UIKit

extension UIColor{
    class func LightBlue() -> UIColor {
        return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    }
    class func LightRed() -> UIColor {
        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    let dateManager = DateManager()
    let daysPerWeek: Int = 7
    let cellMargin: CGFloat = 2.0
    var selectedDate = Date()
    var today: Date!
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

    //1
    func numberOfSecctions(in collectionView: UICollectionView) -> Int {
        
        return 2
        
    }
    //2
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Section毎にcellの総数を変える
        if section  == 0 {
            return 7
        } else {
            return dateManager.daysAcquisitition() //ここは月によって異なる（後ほど説明）
    }
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalenderCell
        
        if (indexPath.row % 7 == 0){
            cell.textLabel.textColor = UIColor.LightRed()
        } else if (indexPath.row % 7 == 6) {
            cell.textLabel.textColor = UIColor.LightBlue()
        } else {
            cell.textLabel.textColor = UIColor.gray
        }
        //テキストの配置
        if indexPath.section == 0 {
            cell.textLabel.text = weekArray[indexPath.row]
        } else {
            cell.textLabel.text = dateManager.conversionDateFormat(indexPath: indexPath)
            //月によって1日お場所は異なる（後で説明）
        }
    return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin: CGFloat = 8.0
        let width: CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin) / CGFloat(daysPerWeek)
        let height: CGFloat = width * 1.0
        return CGSize(width: width, height: height)
    }
    //セルの垂直方向のアージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collctionViewLayout: UICollectionViewLayout, miniumLineSpacingForSectionAt section: Int) ->  CGFloat{
    
        return cellMargin
    }

//headerの月を変更
func changeHeaderTitle(date: Date) -> String{
    let formatter: DateFormatter = DateFormatter()
    formatter.dateFormat = "My/yyyy"
    let selectMonth = formatter.string(from: date)
    return selectMonth
}

    //①タップ時
@IBAction func tappeHeaderPrevBth(sender: UIButton) {
    selectedDate = dateManager.prevMonth(date: selectedDate)
    calenderCollectionView.reloadData()
    headerTitle.text = changeHeaderTitle(date: selectedDate)
}
    //②タップ時
@IBAction func tappeHeaderNextBth(sender: UIButton) {
    selectedDate = dateManager.prevMonth(date: selectedDate)
    calenderCollectionView.reloadData()
    headerTitle.text = changeHeaderTitle(date: selectedDate)
    }
}



