//
//  RPPoetryHelper.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/18.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit
import SQLite

class RPPoetryHelper {
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
    
    private func loadDataBase() {
        guard let path = Bundle.main.path(forResource: "quantangshi.db", ofType: nil) else {
            //要在buidPhases 中添加文件  要不然会找不到
            return
        }
        print(path as Any)
        do {
            db = try Connection(path)
        } catch {
            print(error)
        }
    }
    
    // MARK: - public func
    //获取卷列表
    func loadVolumeList(callBack : @escaping RPPoetryHelperClosures) {
        guard db != nil else {
            print("数据库不存在")
            return
        }
        
        dataQueue.async {
            var volumeArr = [RPPoetryVolumeModel]()
            
            do {
                for poem in try self.db.prepare(self.tMenu) {
                    let volume = RPPoetryVolumeModel()
                    volume.volume = poem[self.tMenuVolume]
                    volume.comment = poem[self.tMenuComment]
                    volume.count = poem[self.tMenuCount]
                    volumeArr.append(volume)
                }
                DispatchQueue.main.async {
                    callBack(volumeArr)
                }
            } catch {
                print(error)
            }
        }
    }
    
    //获所有诗
    func loadAllPoetry(callBack : @escaping RPPoetryHelperClosures) {
        guard db != nil else {
            print("数据库不存在")
            return
        }
        
        dataQueue.async {
            var poetryArr = [RPPoetryBaseModel]()
            
            do {
                for poem in try self.db.prepare(self.tPoetry) {
                    let poetry = RPPoetryBaseModel()
                    poetry.id = poem[self.tPoetryId]
                    poetry.volume = poem[self.tPoetryVolume]
                    poetry.sequence = poem[self.tPoetrySequence]
                    poetry.title = poem[self.tPoetryTitle]
                    poetry.text = poem[self.tPoetryText]
                    poetry.author = poem[self.tPoetryAuthor]
                    poetryArr.append(poetry)
                }
                DispatchQueue.main.async {
                    callBack(poetryArr)
                }
            } catch {
                print(error)
            }
        }
    }

    //按卷号获取诗
    func loadPoetries(inVolume : Int64 ,callBack : @escaping RPPoetryHelperClosures) {
        guard db != nil else {
            print("数据库不存在")
            return
        }
        
        dataQueue.async {
            var poetryArr = [RPPoetryBaseModel]()
            
            do {
                
                for poem in try self.db.prepare(self.tPoetry.filter(self.tPoetryVolume == inVolume)) {
                    let poetry = RPPoetryBaseModel()
                    poetry.id = poem[self.tPoetryId]
                    poetry.volume = poem[self.tPoetryVolume]
                    poetry.sequence = poem[self.tPoetrySequence]
                    poetry.title = poem[self.tPoetryTitle]
                    poetry.text = poem[self.tPoetryText]
                    poetry.author = poem[self.tPoetryAuthor]
                    poetryArr.append(poetry)
                }
                DispatchQueue.main.async {
                    callBack(poetryArr)
                }
            } catch {
                print(error)
            }
        }
    }
    
    //按作者获取诗
    func loadPoetries(ofAuthor : String ,callBack : @escaping RPPoetryHelperClosures) {
        guard db != nil else {
            print("数据库不存在")
            return
        }
        
        dataQueue.async {
            var poetryArr = [RPPoetryBaseModel]()
            
            do {
                
                for poem in try self.db.prepare(self.tPoetry.filter(self.tPoetryAuthor == ofAuthor)) {
                    let poetry = RPPoetryBaseModel()
                    poetry.id = poem[self.tPoetryId]
                    poetry.volume = poem[self.tPoetryVolume]
                    poetry.sequence = poem[self.tPoetrySequence]
                    poetry.title = poem[self.tPoetryTitle]
                    poetry.text = poem[self.tPoetryText]
                    poetry.author = poem[self.tPoetryAuthor]
                    poetryArr.append(poetry)
                }
                DispatchQueue.main.async {
                    callBack(poetryArr)
                }
            } catch {
                print(error)
            }
        }
    }
    
    //获取残诗
    
    
    
}
