//
//  RPPoetryBaseModel.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/18.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

struct RPPoetryBaseModel {
    var id : Int64?
    var title : String?
    var author : String?
    var text : String?
    var lines : [String]?
    var volume : Int64?
    var sequence : Int64?
    
    // 在 class 中实现带有mutating方法的接口时，不用mutating进行修饰。因为对于class来说，类的成员变量和方法都是透明的，所以不必使用 mutating 来进行修饰
    mutating func getLines() -> [String]? {
        if (lines == nil) {
            var arr = [String]()
            let collectionOne = text?.split(separator: "。")
            for strOne in collectionOne! {
                let collectionTwo = strOne.split(separator: "，")
                for strTwo in collectionTwo {
                    if strTwo.contains("\n") {
                        var strTemp = String.init(strTwo)
                        let range = strTemp.range(of: "\n")
                        strTemp.replaceSubrange(range!, with: "")
                        arr.append(String.init(strTemp))
//                        print(strTemp)
                    } else {
                        arr.append(String.init(strTwo))
//                        print(strTwo)
                    }
                    
                }
            }
            lines = arr
        }
        return lines
    }
}

struct RPPoetryVolumeModel {
    var volume : Int64?
    var comment : String?
    var count : Int64?
}