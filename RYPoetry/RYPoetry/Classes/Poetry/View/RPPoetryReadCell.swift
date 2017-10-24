//
//  RPPoetryReadCell.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/20.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPPoetryReadCell: RPBaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - UI
    @IBOutlet weak var tvText: UITextView!
    private func setupUI() {
        tvText.isEditable = false
        tvText.font = RYFontHelper.contentFont()
    }
    
    // MARK: - Data
    func bindText (text:String) {
        tvText.text = text
    }
}
