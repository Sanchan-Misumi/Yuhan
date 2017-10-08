//
//  CalenderCell.swift
//  Yuhan
//
//  Created by Maho Misumi on 2017/09/25.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class CalenderCell: UICollectionViewCell {
    

    
    
    @IBOutlet weak var testLabel: UILabel!
    var textLabel: UILabel!
    
    var tapNumber: Int = 0
    
 
    @IBOutlet var ColorView: UIView!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //UIラベルを作成
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        textLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        textLabel.textAlignment = NSTextAlignment.center
        //Cellに追加
        self.addSubview(textLabel!)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
}
