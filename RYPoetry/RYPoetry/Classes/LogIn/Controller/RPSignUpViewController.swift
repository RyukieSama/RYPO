//
//  RPSignUpViewController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/11/28.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPSignUpViewController: RPBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    // MARK: - UI
    private func setupUI () {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
