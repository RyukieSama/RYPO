//
//  RPMainCell.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/17.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPMainCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lbTitle.font = RYFontHelper.getFontstyle(ttfName: "asd", fontSize: 24)
    }
    
    func bindCellModel(cellModel : RPMainCellModel) {
        lbTitle.text = cellModel.title
        
    }
    
    // MARK: - UI
    @IBOutlet weak var lbTitle: UILabel!
}
