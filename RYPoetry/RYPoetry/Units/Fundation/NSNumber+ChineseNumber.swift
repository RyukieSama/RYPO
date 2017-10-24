//
//  NSNumber+ChineseNumber.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/24.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import Foundation

extension NSNumber {
    
    /// 返回格式化的字符转   一百八十九   这样的
    func chineseNumberString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        let chinese = formatter.string(from: self) ?? ""
        return chinese
    }
}
