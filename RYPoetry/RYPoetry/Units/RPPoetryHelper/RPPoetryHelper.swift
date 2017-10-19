//
//  RPPoetryHelper.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/18.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit
import SQLite

struct RPPoetryHelper {
    typealias RPPoetryHelperClosures = ([Any]) -> ()
    //singleton
    static let sharedHelper = RPPoetryHelper()
    private init() {
        loadDataBase()
    }
    
    private var db : Connection!
    private var isWorking : Bool?
    private let dataQueue = DispatchQueue(label: "RPPoetryQueue")
    // MARK: - Menu
    private let tMenu = Table("menu") //目录表
//    private let tMenuId = Expression<Int64>("id")      //主键
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
    
    // MARK: - public func
    func loadVolumeList(callBack : @escaping RPPoetryHelperClosures) {
        if db == nil {
            print("数据库不存在")
            return
        }
        dataQueue.async {
            var volumeArr = [RPPoetryVolumeModel]()
            
            do {
                for poem in try self.db.prepare(self.tMenu) {
                    var volume = RPPoetryVolumeModel()
                    volume.volume = poem[self.tMenuVolume]
                    volume.comment = poem[self.tMenuComment]
                    volumeArr.append(volume)
                }
//                if callBack != nil {
                    callBack(volumeArr)
//                }
            } catch {
                print(error)
            }
        }
    }
    
    func loadAllPoetry(callBack : @escaping RPPoetryHelperClosures) {
        if db == nil {
            print("数据库不存在")
            return
        }
        dataQueue.async {
            var poetryArr = [RPPoetryBaseModel]()
            
            do {
                for poem in try self.db.prepare(self.tPoetry) {
                    var poetry = RPPoetryBaseModel()
                    poetry.id = poem[self.tPoetryId]
                    poetry.volume = poem[self.tPoetryVolume]
                    poetry.sequence = poem[self.tPoetrySequence]
                    poetry.title = poem[self.tPoetryTitle]
                    poetry.text = poem[self.tPoetryText]
                    poetryArr.append(poetry)
                }
                callBack(poetryArr)
            } catch {
                print(error)
            }
        }
    }
    
    func readData() -> [RPPoetryBaseModel] {
        if db == nil {
            return [RPPoetryBaseModel]()
        }
        var poetryArr = [RPPoetryBaseModel]()
        
        do {
            for poem in try db.prepare(tPoetry) {
                var poetry = RPPoetryBaseModel()
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
