//
//  RPHomeController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/9/28.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit
import SnapKit

class RPHomeController: UIViewController {

    // MARK: - Life
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - function
    private func setupUI() {
        view.backgroundColor = UIColor.darkGray
        
        view.addSubview(lbText)
        lbText.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    // MARK: - Lazy
    private lazy var lbText : UILabel = {
        var lb = UILabel()
        lb.text = "诗客\nRyukieSama\n😂\n詩囡囡⑤乄"
        lb.numberOfLines = 0
        lb.backgroundColor = UIColor.white
        lb.textColor = UIColor.black
        lb.font = RYFontHelper.getFontstyle(ttfName: "asd", fontSize: 24)
        return lb
    }()
    
}
