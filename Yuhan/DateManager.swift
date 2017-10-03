//
//  DateManager.swift
//  Yuhan
//
//  Created by Maho Misumi on 2017/09/25.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

extension Date {
    func monthAgoDate() -> Date {
        let addValue = -1
        let calender = Calendar.current
        var dateComoonebts = DateComponents()
        dateComoonebts.month = addValue
        return calender.date(byAdding: dateComoonebts, to: self)!
//      return calender.date(byAdding: dateComponents, to: self)!
    }
    
    func monthLaterDate() -> Date {
        let addValue: Int = 1
        let calender = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = addValue
        return calender.date(byAdding: dateComponents, to: self)!
    }
}
class DateManager: NSObject{
    var currentMonthDates = [Date]() //表記する月の配列
    var selectedDate = Date()
    let daysPerWeek: Int = 7
    var numberOfItems: Int!
    
    //月ごとのセルの数を返すメソッド
    func daysAcquisitition() -> Int {
        let rangeOfWeeks = Calendar.current.range(of: .weekOfMonth, in: .month, for: firstDateOfMonth())
//     let rangeOfWeeks = Calender.current.range(of: .weekOfMonth, in: .month, for:  firstDateOfMonth())
        let numberOfWeeks = rangeOfWeeks!.count
        numberOfItems = numberOfWeeks * daysPerWeek
//        let numberOfWeeks = rangeOfWeeks ＊ daysPerWeek //週の数×列
        return numberOfItems
    }
    //月の初日を取得
    func firstDateOfMonth() -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: selectedDate)
        components.day = 1
        
        let firstDateMonth = Calendar.current.date(from: components)
        return firstDateMonth!
    }
    
    //（１）表記する日にちの取得
    func dateForCellAtIndexPath(numberOfItems: Int) {
        //①「月の初めが週の何日めか」を計算する
        let ordinalityOfFirstday = Calendar.current.ordinality(of: .day, in: .weekOfMonth, for: firstDateOfMonth())!
        for i in 0 ..< numberOfItems {
       //②「月の初日」と「IndexPath.item番目のセルに表示させる日」の差を計算する
            var dateComponents = DateComponents()
            dateComponents.day = i - (ordinalityOfFirstday - 1)
            //③表示する月の初日から②で計算した差を引いた日付を取得
            let date = Calendar.current.date(byAdding: dateComponents, to: firstDateOfMonth())!
            //④配列に追加
            currentMonthDates.append(date)
        }
    }
    //(2)表記の変更
    func conversionDateFormat(indexPath: IndexPath) -> String {
        dateForCellAtIndexPath(numberOfItems: numberOfItems)
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: currentMonthDates[indexPath.row])
    }
    
    //前月の表示
    func prevMonth(date: Date) -> Date {
        currentMonthDates = []
        selectedDate = date.monthAgoDate()
        return selectedDate
    }
    //次月の表示
    func nextMonth(date: Date) -> Date {
        currentMonthDates = []
        selectedDate = date.monthLaterDate()
        return selectedDate
    }
}

    


