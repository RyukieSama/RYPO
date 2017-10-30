//
//  RPDetailSettingController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/18.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPDetailSettingController: RPBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingToMain" {
            let vc = segue.destination as! RPBaseController
            vc.rpBaseVCDoSomthing(someThing: tfInput.text as Any)
        }
    }
    
    // MARK: - auction
    @IBAction func dismissClick(_ sender: Any) {
        if (baseClosure != nil) {baseClosure!(tfInput.text as Any)}
        dismiss(animated: true) {
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfInput.endEditing(true)
    }
    
    // MARK: - UI
    @IBOutlet weak var tfInput: UITextField!
    
}
