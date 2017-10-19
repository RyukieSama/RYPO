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
        lbNumber.text = "卷\(volume.volume ?? 0)"
        lbAuthor.text = volume.comment
        lbCount.text = "\(volume.count ?? 0)篇"
    }
    
    // MARK: - UI
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbCount: UILabel!
}
