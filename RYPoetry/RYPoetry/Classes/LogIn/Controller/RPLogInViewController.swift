//
//  RPLogInViewController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/11/28.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPLogInViewController: RPBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    // MARK: - action
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfAccount.endEditing(true)
        tfPasword.endEditing(true)
    }
    
    @IBAction func btDismissClick(_ sender: Any) {
        dismiss(animated: true) {
            
        }
    }
    
    // MARK: - UI
    private func setupUI() {
        
    }
    
    @IBOutlet weak var tfAccount: UITextField!
    @IBOutlet weak var tfPasword: UITextField!
    @IBOutlet weak var btLogin: UIButton!

}
