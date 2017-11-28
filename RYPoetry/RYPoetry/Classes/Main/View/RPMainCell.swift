//
//  RPMainCell.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/17.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPMainCell: RPBaseCollectionCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        contentView.backgroundColor = UIColor.white
        lbTitle.font = RYFontHelper.getFontstyle(ttfName: "asd", fontSize: 42)
        btOne.titleLabel?.font = RYFontHelper.contentFont()
        btOne.titleLabel?.textAlignment = NSTextAlignment.center
        btTwo.titleLabel?.font = RYFontHelper.contentFont()
        btTwo.titleLabel?.textAlignment = NSTextAlignment.center
    }
    
    func bindCellModel(cellModel : RPMainCellModel) {
        switch cellModel.type {
        case .read:
            lbTitle.text = "鉴\n赏"
            cellModel.title = "鉴赏"
            btOne.setTitle("卷", for: UIControlState.normal)
            btTwo.setTitle("全", for: UIControlState.normal)
            segueOneID = Segue_VolumeMainID
            segueTwoID = Segue_AllListID
            
            break
        case .fight:
            lbTitle.text = "对\n诗"
            cellModel.title = "对诗"
            btOne.setTitle("对饮", for: UIControlState.normal)
            btTwo.setTitle("独酌", for: UIControlState.normal)
            segueOneID = ""
            segueTwoID = ""
            break
        case .travel:
            lbTitle.text = "游\n历"
            cellModel.title = "游历"
            btOne.setTitle("残", for: UIControlState.normal)
            btTwo.setTitle("完", for: UIControlState.normal)
            segueOneID = ""
            segueTwoID = ""
            break
        case .mine:
            lbTitle.text = "孤\n家\n寡\n人"
            cellModel.title = "孤家寡人"
            btOne.setTitle("", for: UIControlState.normal)
            btTwo.setTitle("", for: UIControlState.normal)
            segueOneID = ""
            segueTwoID = ""
            break
            
        default: break
            
        }
        
    }
    
    // MARK: - function
    @IBAction func btOneClick(_ sender: Any) {
        if (cellClosures != nil) {
            cellClosures!(segueOneID as Any)
        }
    }
    
    @IBAction func btTwoClick(_ sender: Any) {
        if (cellClosures != nil) {
            cellClosures!(segueTwoID as Any)
        }
    }
    
    // MARK: - UI
//    weak var : RPBaseController?
    @IBOutlet weak var btTwo: UIButton!
    @IBOutlet weak var btOne: UIButton!
    @IBOutlet weak var lbTitle: UILabel!
    var segueOneID : String?
    var segueTwoID : String?
}
