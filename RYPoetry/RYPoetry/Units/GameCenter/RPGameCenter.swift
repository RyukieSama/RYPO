//
//  RPGameCenter.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/11/29.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import Foundation
import GameKit

let RPLocalPlayer = GKLocalPlayer.localPlayer()

class RPGameCenter : NSObject {
    class func authenticateLocalPlayer() {
        RPLocalPlayer.authenticateHandler = {(controller , error) in
            if controller != nil {
                self.showAuthenticationDialogWhenReasonable()
            }
            else if RPLocalPlayer.isAuthenticated {
                self.login(localPlayer: RPLocalPlayer)
            }
            else {
                print("不支持GC")
            }
        }
    }
    
    private class func showAuthenticationDialogWhenReasonable() {
        showAlertForGAmeCenter()
    }
    
    /// 弹窗提示设置GC
    private class func showAlertForGAmeCenter() {
        let alertVC = UIAlertController.init(title: "提示", message: "开启GameCenter", preferredStyle: .alert)
        
        let actionCancel = UIAlertAction.init(title: "取消", style: .default) { (action) in
            alertVC.dismiss(animated: true, completion: {
            })
        }
        
        let actionTo = UIAlertAction.init(title: "设置", style: .default) { (action) in
            print("去设置页面")
        }
        
        alertVC.addAction(actionCancel)
        alertVC.addAction(actionTo)
        
        RP_WINDOW_ROOT_VC?.present(alertVC, animated: true, completion: {
            
        })
    }
    
    private class func login(localPlayer : GKLocalPlayer) {
//        localPlayer.generateIdentityVerificationSignature { (publicKeyUrl, signature, salt, timestamp, error) in
//
//        }
        print(localPlayer.playerID as Any)
        
    }
}
