//
//  RPPoetryBaseModel.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/18.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit
import LeanCloud

//索引一张表
//诗一张表
//诗的属性一张表

/// 诗的内容类型
///
/// - normal: 正常
/// - fragmentary: 残缺
/// - symbols: 有特殊符号的
enum RPPoetryContentType : String {
    case normal = "normal"
    case fragmentary = "fragmentary"
    case symbols = "symbols"
}

/// 诗的类型
///
/// - quatrain: 绝句
/// - pentasyllabic: 五言律诗
/// - heptasyllabic: 七言律诗
/// - long: 排律
/// - folk: 乐府诗
/// - songCi: 宋词
/// - other: 其他
enum RPPoetryLineType : String {
    case quatrain = "quatrain"
    case pentasyllabic = "pentasyllabic"
    case heptasyllabic = "heptasyllabic"
    case long = "long"
    case folk = "folk"
    case songCi = "songCi"
    case other = "other"
}

/// 时间类型
///
/// - tang: 唐代
/// - song: 宋代
enum RPPoetryTimeType : String {
    case tang = "tang"
    case song = "song"
}

class RPPoetryBaseModel : LCObject {
    // LCObject 子类化必须的操作
    override static func objectClassName() -> String {
        return "Poetry"
    }
    /// 数据ID
    @objc dynamic var id : LCNumber?
    /// 标题
    @objc dynamic var title : LCString?
    /// 作者
    @objc dynamic var author : LCString?
    /// 全文本
    @objc dynamic var text : LCString?
    /// 卷号
    @objc dynamic var volume : LCNumber?
    /// 所在卷中的序号
    @objc dynamic var sequence : LCNumber?
    
    @objc dynamic var contentType : LCString?
    @objc dynamic var lineType : LCString?
    /// 诗句数组
    lazy var lines : [String] = {
        var arr = [String]()
        let collectionOne = text?.stringValue?.split(separator: "。")
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
    lazy var lineCount : Int = Int({
        return lines.count
        }())
}

class RPPoetryVolumeModel : LCObject {
    override static func objectClassName() -> String {
        return "RPPoetryVolumeModel"
    }
    @objc dynamic var volume : LCNumber?
    @objc dynamic var comment : LCString?
    @objc dynamic var count : LCNumber?
}

class RPAuthorModel : LCObject {
    override static func objectClassName() -> String {
        return "Author"
    }
    
    //TODO: 重名问题
    
    /// 姓名
    @objc dynamic var name : LCString?
    /// 描述
    @objc dynamic var desc : LCString?
    /// 朝代
    @objc dynamic var dynasty : LCString?
}
