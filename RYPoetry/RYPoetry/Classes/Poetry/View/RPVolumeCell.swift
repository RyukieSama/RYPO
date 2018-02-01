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
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindModel(volume : RPPoetryVolumeModel) {
        lbNumber.text = "卷" + NSNumber(value: (volume.volume?.intValue)!).chineseNumberString()
        lbAuthor.text = volume.comment?.stringValue
        lbCount.text = NSNumber(value:(volume.count?.intValue)!).chineseNumberString() + "篇"
    }
    
    // MARK: - UI
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbCount: UILabel!
    private func setupUI () {
        lbNumber.font = RYFontHelper.contentFont()
        lbAuthor.font = RYFontHelper.titleFont()
        lbCount.font = RYFontHelper.contentFont()
    }
    
}
