//
//  RPGameCenter.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/11/29.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import Foundation
import GameKit
import LeanCloud

let RPLocalPlayer = GKLocalPlayer.localPlayer()

class RPGameCenter : NSObject {
    class func authenticateLocalPlayer() {
        RPLocalPlayer.authenticateHandler = {(controller , error) in
            if controller != nil {
                //自动弹出 GameCenter登录 完成后会自动执行登录
                RP_WINDOW_ROOT_VC?.present(controller!, animated: true, completion: {
                })
            }
            else if RPLocalPlayer.isAuthenticated {
                self.login(localPlayer: RPLocalPlayer)
            }
            else {
                print("不支持GC")
            }
        }
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
        print(localPlayer.playerID as Any)
        
        //登录
        RPUser.logIn(username: localPlayer.playerID!, password: localPlayer.playerID!) { (result) in
            switch result {
            case .success(let user):
                print("======登录成功======")
                print(user)
                break
            case .failure(let error):
                print("======登录失败======")
                print(error)
                if error.code == LC_ERROR_NO_USER {
                    //注册
                    signUp(localPlayer: localPlayer)
                }
            }
        }
    }
    
    private class func signUp(localPlayer : GKLocalPlayer) {
        let currentUser = RPUser()
        currentUser.username = LCString(localPlayer.playerID!)
        currentUser.password = LCString(localPlayer.playerID!)
        currentUser.nickName = LCString(localPlayer.alias!)
        currentUser.signUp { (signUpResult) in
            switch signUpResult {
            case .success :
                print(localPlayer.alias! + "注册成功")
                break
            case .failure(let error):
                print(error)
            }
        }
    }
}
