//
//  RPPoetryInfoCell.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/20.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPPoetryInfoCell: RPBaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - UI
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    
    // MARK: - data
    func bindPoetry(poetry : RPPoetryBaseModel) {
        lbTitle.text = poetry.title
        lbAuthor.text = poetry.author
    }
}
