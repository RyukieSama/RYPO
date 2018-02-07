//
//  RPConstants.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/16.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

// MARK: - UI
let RP_SCREEN_BOUNDS : CGRect = UIScreen.main.bounds
let RP_WINDOW_ROOT_VC = UIApplication.shared.keyWindow?.rootViewController

// MARK: - segue
enum RPSegueName : String {
    case volumeMain = "segueToVolumeMain"
    case allList = "segueToAllList"
    case userCenter = "segueToUserCenter"
}

//public struct RPConfig {
//    // MARK: - segue
//    public struct RPSegue {
//        public let volumeMain = "segueToVolumeMain"
//        public let allList = "segueToAllList"
//        public let userCenter = "segueToUserCenter"
//    }
//    public static let segue = RPSegue()
    
//}

// MARK: - LeanCloud
let LeanCloud_APP_ID = "XNiw5AEeFSP066271OfwpGqY-gzGzoHsz"
let LeanCloud_APP_KEY = "0hAwFl1lKoVgoKDKGQH4Wz7q"
