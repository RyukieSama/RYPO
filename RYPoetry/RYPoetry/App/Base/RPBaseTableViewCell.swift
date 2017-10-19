//
//  RPBaseTableViewCell.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/19.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPBaseTableViewCell: UITableViewCell {

    typealias BaseTVCellClosures = (Any) -> ()
    
    var cellClosures : BaseTVCellClosures?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = UITableViewCellSelectionStyle.none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
