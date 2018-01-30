//
//  RPUser.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/11/29.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import LeanCloud

/// Could not find user.
let LC_ERROR_NO_USER = 211

class RPUser: LCUser {
    /// 用户昵称
    //http://swifter.tips/objc-dynamic/
    @objc dynamic var nickName : LCString? {
        didSet {
            set("nickName", value: nickName)
        }
    }
    
    static func rpCurrentUser() -> RPUser {
        return RPUser.current! as! RPUser
    }
    
}
