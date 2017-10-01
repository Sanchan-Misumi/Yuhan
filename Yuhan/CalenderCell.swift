//
//  CalenderCell.swift
//  Yuhan
//
//  Created by Maho Misumi on 2017/09/25.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class CalenderCell: UICollectionViewCell {
    
    var textLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
    override init (frame: CGRect){
        super.init(frame: frame)
        //UIラベルを作成
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        textLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        textLabel.textAlignment = NSTextAlignment.center
        //Cellに追加
        self.addSubview(textLabel!)
    }
    
//    override init(frame: CGRect){
//        super.init(frame: frame)
//    }
}
