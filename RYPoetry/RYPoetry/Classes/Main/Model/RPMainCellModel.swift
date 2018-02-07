//
//  RPMainCellModel.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/18.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

enum RPMainCellType {
    case none
    case read
    case fight
    case travel
    case mine
}

class RPMainCellModel: NSObject {
    var title : String = "title"
    var titleL : String = "titleL"
    var type : RPMainCellType = RPMainCellType.none
    lazy var segueId : String = {
        switch type {
        case .read:
            return R.segue.rpMainController.segueToVolumeMain.identifier
        case .fight:
            return ""
        case .travel:
            return ""
        case .mine:
            return R.segue.rpMainController.segueToUserCenter.identifier
        default:
            return ""
        }
    }()
}
