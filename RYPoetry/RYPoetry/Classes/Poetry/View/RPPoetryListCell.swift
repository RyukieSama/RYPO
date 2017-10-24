//
//  RPPoetryListCell.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/19.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPPoetryListCell: RPBaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindPoetryModel(poetry : RPPoetryBaseModel) {
        lbTitle.text = poetry.title
        lbAuthor.text = poetry.author
    }
    
    // MARK: - UI
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    
    private func setupUI () {
        lbTitle.font = RYFontHelper.contentFont()
        lbAuthor.font = RYFontHelper.subtitleFont()
    }
}
