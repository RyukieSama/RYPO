//
//  RPPoetryBaseModel.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/18.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

//索引一张表
//诗一张表
//诗的属性一张表

/// 诗的内容类型
///
/// - normal: 正常
/// - fragmentary: 残缺
/// - symbols: 有特殊符号的
enum RPPoetryContentType {
    case normal
    case fragmentary
    case symbols
}

/// 诗的类型
///
/// - quatrain: 绝句
/// - pentasyllabic: 五言律诗
/// - heptasyllabic: 七言律诗
/// - long: 排律
/// - folk: 乐府诗
/// - other: 其他
enum RPPoetryLineType {
    case quatrain
    case pentasyllabic
    case heptasyllabic
    case long
    case folk
    case other
}

class RPPoetryBaseModel {
    /// 数据ID
    var id : Int64?
    /// 标题
    var title : String?
    /// 作者
    var author : String?
    /// 全文本
    var text : String?
    /// 卷号
    var volume : Int64?
    /// 所在卷中的序号
    var sequence : Int64?
    var contentType : RPPoetryContentType?
    var lineType : RPPoetryLineType?
    /// 诗句数组
    lazy var lines : [String] = {
        var arr = [String]()
        let collectionOne = text?.split(separator: "。")
        for strOne in collectionOne! {
            let collectionTwo = strOne.split(separator: "，")
            for strTwo in collectionTwo {
                guard strTwo.contains("\n") else {
                    arr.append(String.init(strTwo))
                    continue
                }
                
                var strTemp = String.init(strTwo)
                let range = strTemp.range(of: "\n")
                strTemp.replaceSubrange(range!, with: "")
                arr.append(String.init(strTemp))
            }
        }
        return arr
    }()
    /// 行数
    lazy var lineCount : Int64 = Int64({
        return lines.count
        }())
}

class RPPoetryVolumeModel {
    var volume : Int64?
    var comment : String?
    var count : Int64?
}
