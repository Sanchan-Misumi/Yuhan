//
//  DateManager.swift
//  Yuhan
//
//  Created by Maho Misumi on 2017/09/25.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit



var currentMonthOfDates = [NSDate]() //表記する月の配列
var selectedDate = NSDate()
let daysPerWeek: Int! = nil
var numberOfItems: Int!


class DateManager: NSObject {



    //月ごとのセルの数を返すメソッド
    func daysAcquisition() -> Int {
       // let rangeOfWeeks = NSCalendar.currentCalender().rangeOfUnit(NSCalendarUnit.WeekOfMonth, inUnit: NSCalendarUnit.Month, forDate: firstDateOfMonth())
       // let numberOfWeeks = rangeOfWeeks.length //月が持つ週の数
   numberOfItems = numberOfWeeks * daysPerWeeks//週の数×列の数
        return numberOfItems
    }
//月の初日を取得
    func firstDateOfMonth() -> NSDate {
        let components = Calender.current.dateComponents([.Year, .Month, .Day], fromDate: selectedDate)
        components.day = 1
        let firstDateMonth = NSCalendar.currentCalender().dateFromComponents(components)!
        return firstDateMonth
    }
    

}
