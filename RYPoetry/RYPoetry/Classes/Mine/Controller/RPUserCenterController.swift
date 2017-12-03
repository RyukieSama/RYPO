//
//  RPUserCenterController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/11/29.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit
import GameKit

class RPUserCenterController: RPBaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadUserData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    // MARK: - function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true) {
        }
    }
    
    private func loadUserData() {
        lbNickName.text = RPLocalPlayer.alias;
        btUser.setTitle("", for: .normal)
        btUser.backgroundColor = UIColor.gray
        
        //TODO: 切换用户也要处理
        RPLocalPlayer.loadPhoto(for: .normal) { (image, error) in            
            if image != nil {
                self.btUser.setImage(image, for: .normal)
            }
            
            if error != nil {
                print(error!)
            }
        }
    }

    // MARK: - ACTION
    @IBAction func gameCenterClick(_ sender: Any) {
        let vc = GKGameCenterViewController()
        vc.gameCenterDelegate = self
        present(vc, animated: true) {
            
        }
    }
    
    
    // MARK: -  UI
    @IBOutlet weak var btUser: UIButton!
    @IBOutlet weak var lbNickName: UILabel!
    
    private func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

extension RPUserCenterController : GKGameCenterControllerDelegate {
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true) {
            
        }
    }
}
