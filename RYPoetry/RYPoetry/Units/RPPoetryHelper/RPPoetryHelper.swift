//
//  RPPoetryHelper.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/18.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit
import SQLite

//"RYPoetry/Resource/quantangshi.db"

struct RPPoetryHelper {
    private var db : Connection!
    
    // MARK: - Menu
    private let tMenu = Table("menu") //目录表
    private let tMenuId = Expression<Int64>("id")      //主键
    private let tMenuVolume = Expression<Int64>("volume")  //卷数
    private let tMenuComment = Expression<String>("comment") //诗人
    private let tMenuCount = Expression<Int64>("count") //数量
    
    // MARK: - Poetry
    private let tPoetry = Table("poem") //目录表
    private let tPoetryId = Expression<Int64>("id")      //主键
    private let tPoetryVolume = Expression<Int64>("volume")  //卷数
    private let tPoetrySequence = Expression<Int64>("sequence") //所在卷中的序号
    private let tPoetryTitle = Expression<String>("title") //标题
    private let tPoetryAuthor = Expression<String>("author") //作者
    private let tPoetryText = Expression<String>("text") //内容
    
    init() {
        loadDataBase()
    }
    
    func dataBaseStart() {
        
    }
    
    private mutating func loadDataBase() {
        let path = Bundle.main.path(forResource: "quantangshi.db", ofType: nil)
        if path == nil {
            //要在buidPhases 中添加文件  要不然会找不到
            return
        }
        print(path as Any)
        do {
            db = try Connection(path!)
        } catch {
            print(error)
        }
    }
    
    func readData() -> [RPPoetryBaseModel] {
        if db == nil {
            return [RPPoetryBaseModel]()
        }
        var poetryArr = [RPPoetryBaseModel]()
        
        do {
            for poem in try db.prepare(tPoetry) {
                let poetry = RPPoetryBaseModel()
                poetry.volume = poem[tPoetryVolume]
                poetry.sequence = poem[tPoetrySequence]
                poetry.title = poem[tPoetryTitle]
                poetry.text = poem[tPoetryText]
                poetryArr.append(poetry)
            }
        } catch {
            print(error)
        }
        
        return poetryArr
    }
    
}
