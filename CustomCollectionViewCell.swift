//
//  CustomCollectionViewCell.swift
//  Yuhan
//
//  Created by Maho Misumi on 2017/10/08.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet var toziruBtn: UIButton!
    @IBOutlet var openBtn: UIButton!
    @IBOutlet var clearBtn: UIButton!
    

    @IBOutlet weak var testLabel: UILabel!
    
    @IBAction func openBtn(_ sender: UIButton) {
        closeBtn.isHidden = false
        datePicker.isHidden = false
        toziruBtn.isHidden = false
        clearBtn.isHidden = false
    }
}
