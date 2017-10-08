//
//  ViewController.swift
//  Yuhan
//
//  Created by Maho Misumi on 2017/09/22.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//
import UIKit

extension UIColor{
    class func LightBlue() -> UIColor {
        return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    }
    class func LightRed() -> UIColor {
        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    }
}

class ViewController: UIViewController, UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //データ変更時の呼び出しメソッド
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        testLabel.text = formatter.string(from: sender.date)
    }
   @IBOutlet weak var testLabel: UILabel!
//
    //変数を宣言する
    //今日の日付を代入
    let nowDate = Date()
    let dateFormat = DateFormatter()
    let inputDatePicker = UIDatePicker()
    @IBOutlet weak var dateSelecter: UITextField!

    
    //カレンダー
    let dateManager = DateManager()
    let daysPerWeek: Int = 7
    let cellMargin: CGFloat = 2.0
    var selectedDate = Date()
    var today: Date!
    let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    @IBOutlet weak var headerPrevBtn: UIButton! //①
    @IBOutlet weak var headerNextBtn: UIButton! //②
    @IBOutlet weak var headerTitle: UILabel! //③最初の月を治す
    @IBOutlet weak var calenderHeaderView: UIView! //①
    @IBOutlet weak var calenderCollectionView: UICollectionView! //①
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet var toziruBtn: UIButton!
    @IBOutlet var openBtn: UIButton!
    @IBOutlet var clearBtn: UIButton!

    @IBAction func tapedtoziruBtn(sender: UIButton){
        closeBtn.isHidden = true
        datePicker.isHidden = true
        toziruBtn.isHidden = true
        clearBtn.isHidden = true
    }
    
    @IBAction func tapedCloseBtn(sender: UIButton) {
        closeBtn.isHidden = true
        datePicker.isHidden = true
        toziruBtn.isHidden = true
        clearBtn.isHidden = true
    }
    @IBAction func tapedopenBtn(sender: UIButton) {
        closeBtn.isHidden = false
        datePicker.isHidden = false
        toziruBtn.isHidden = false
        clearBtn.isHidden = false
    }
    @IBAction func tapedclear(sender: UIButton) {
        testLabel.text = ""
         closeBtn.isHidden = true
        datePicker.isHidden = true
        toziruBtn.isHidden = true
        clearBtn.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        calenderCollectionView.delegate = self
        calenderCollectionView.dataSource = self
        calenderCollectionView.backgroundColor = UIColor.white
        
        // nibNameにはxib名を記載
        let nib = UINib(nibName: "customCell", bundle: nil)
        
        // forCellWithReuseIdentifierには
        // "Collection Reusable View"のIdentifierで指定したものを設定
        calenderCollectionView.register(nib, forCellWithReuseIdentifier: "cellId")
    
    }
//
    //ここを今あるDatePickerに入れたい
    //完了を押すとピッカーの値を、テキストフィールドに挿入して、ピッカーを閉じる
    func closeBtnPush(sender: UIBarButtonItem){
        let pickerDate = inputDatePicker.date
        self.view.endEditing(true)
    }
    //1
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
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
        cell.ColorView.backgroundColor = UIColor.white
        cell.ColorView.layer.cornerRadius = cell.ColorView.bounds.width / 2
        cell.ColorView.layer.masksToBounds = true
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellMargin
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let cell = collectionView.cellForItem(at: indexPath) as! CalenderCell
        
        cell.tapNumber = cell.tapNumber + 1
        
         if cell.tapNumber % 3 == 0 {
            cell.ColorView.backgroundColor = UIColor.white
        }  else if cell.tapNumber % 3 == 1 {
            cell.ColorView.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 0.2)
        } else {
            cell.ColorView.backgroundColor = UIColor(red: 0.0, green: 0.502, blue: 1.0, alpha: 0.2)
        }
        }
    //headerの月を変更
    func changeHeaderTitle(date: Date) -> String{
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "MM"
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
     selectedDate = dateManager.nextMonth(date: selectedDate)
     calenderCollectionView.reloadData()
     headerTitle.text = changeHeaderTitle(date: selectedDate)
        }
   
    
    }

