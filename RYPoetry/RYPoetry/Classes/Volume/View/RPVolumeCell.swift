//
//  RPVolumeCell.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/19.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPVolumeCell: RPBaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindModel(volume : RPPoetryVolumeModel) {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .spellOut
//        let volumeString = formatter.string(from: NSNumber(value: volume.volume!))
//        let countString = formatter.string(from: NSNumber(value:volume.count!))
        
        lbNumber.text = "卷" + NSNumber(value: volume.volume!).chineseNumberString()
        lbAuthor.text = volume.comment
        lbCount.text = NSNumber(value:volume.count!).chineseNumberString() + "篇"
    }
    
    // MARK: - UI
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbCount: UILabel!
    
    
}
