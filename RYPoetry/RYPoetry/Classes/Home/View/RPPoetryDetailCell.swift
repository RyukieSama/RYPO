//
//  RPPoetryDetailCell.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/17.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPPoetryDetailCell: UITableViewCell {

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
    @IBOutlet weak var lbText: UILabel!
    
    private func setupUI() {
        contentView.backgroundColor = UIColor.gray
        //文字
        lbText.textColor = UIColor.black
        lbText.font = RYFontHelper.getFontstyle(ttfName: "asd", fontSize: 24)
        lbText.text = "啊实打实大声大声打的见你人贵人屠洪刚一和人体UK基督教看去玩儿推哦平地方规划九克拉"
    }
}
