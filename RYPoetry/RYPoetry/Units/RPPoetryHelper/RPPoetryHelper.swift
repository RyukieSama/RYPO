//
//  RPPoetryHelper.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/18.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit
import SQLite
import LeanCloud

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
    private let tMenuVolume = Expression<Int>("volume")  //卷数
    private let tMenuComment = Expression<String>("comment") //诗人
    private let tMenuCount = Expression<Int>("count") //数量
    // MARK: - Poetry
    private let tPoetry = Table("poem") //目录表
    private let tPoetryId = Expression<Int>("id")      //主键
    private let tPoetryVolume = Expression<Int>("volume")  //卷数
    private let tPoetrySequence = Expression<Int>("sequence") //所在卷中的序号
    private let tPoetryTitle = Expression<String>("title") //标题
    private let tPoetryAuthor = Expression<String>("author") //作者
    private let tPoetryText = Expression<String>("text") //内容
    
    private let perFileCount = 1000
    private let fileAuthorsSong = "authors.song"
    /// 0~254,000 per 1,000
    private let filePoetSong = "poet.song"
    private let fileNumberSong = 255
    private let fileAuthorsTang = "authors.tang"
    /// 0~57,000 per 1,000
    private let filePoetTang = "poet.tang"
    private let fileNumberTang = 58
    
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
                    volume.volume = LCNumber(integerLiteral: poem[self.tMenuVolume])
                    volume.comment = LCString(poem[self.tMenuComment])
                    volume.count = LCNumber(integerLiteral: poem[self.tMenuCount])
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
                    poetryArr.append(self.poetryFromPoem(poem: poem))
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
    func loadPoetries(inVolume : Int ,callBack : @escaping RPPoetryHelperClosures) {
        guard db != nil else {
            print("数据库不存在")
            return
        }
        
        dataQueue.async {
            var poetryArr = [RPPoetryBaseModel]()
            
            do {
                
                for poem in try self.db.prepare(self.tPoetry.filter(self.tPoetryVolume == inVolume)) {
                    poetryArr.append(self.poetryFromPoem(poem: poem))
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
                    poetryArr.append(self.poetryFromPoem(poem: poem))
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
    
    
    
    //处理诗数据
    static func judgePoetry(poetry: RPPoetryBaseModel) -> RPPoetryBaseModel {
        //行类型
        poetry.lineType = LCString(judgePoetryLinesType(poetry: poetry).rawValue)
        //内容类型
        poetry.contentType = LCString(judgePoetryContentType(poetry: poetry).rawValue)
        return poetry
    }
    
    /// 获取诗的内容类型
    ///
    /// - Parameter poetry:
    /// - Returns:
    static private func judgePoetryContentType(poetry: RPPoetryBaseModel) -> RPPoetryContentType {
        //内容类型
        
        
        return .normal
    }
    
    /// 获取诗的格式类型
    ///
    /// - Parameter poetry:
    /// - Returns:
    static private func judgePoetryLinesType(poetry: RPPoetryBaseModel) -> RPPoetryLineType {
        //内容类型
        
        
        return .quatrain
    }
    
    /// 存储 poetrys
    ///
    /// - Parameter poetrys: 需要存到数据库的
    static func savePoetrys(poetrys: [RPPoetryBaseModel]) {
        
    }
    
    /// 保存目录
    ///
    /// - Parameter volumes: 目录
    static func saveVolumes(volumes: [RPPoetryVolumeModel]) {
        
    }
    
    private func poetryFromPoem(poem: Row) -> (RPPoetryBaseModel) {
        let poetry = RPPoetryBaseModel()
        poetry.id = LCNumber(integerLiteral: poem[self.tPoetryId])
        poetry.volume = LCNumber(integerLiteral: poem[self.tPoetryVolume])
        poetry.sequence = LCNumber(integerLiteral: poem[self.tPoetrySequence])
        poetry.title = LCString(poem[self.tPoetryTitle])
        poetry.text = LCString(poem[self.tPoetryText])
        poetry.author = LCString(poem[self.tPoetryAuthor])
        return poetry
    }
    
    // MARK: - NewDataSource
    //获取作者列表
    func authorsListFromFile(type : RPPoetryTimeType) -> [Any]? {
        var fileName:String
        
        switch type {
        case .song:
            fileName = fileAuthorsSong
        default:
            fileName = fileAuthorsTang
        }
        
        let filePath = Bundle.main.path(forResource: fileName, ofType: "json")
        
        do {
            let jsonString = try String(contentsOfFile: filePath!, encoding: String.Encoding.utf8)
            let data = jsonString.data(using: String.Encoding.utf8)
            let authors = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String : Any]]
            
            //转模型上传
            //TODO:   BoringSSL   问题
            for i in 0..<authors.count {
                
                let dic = authors[i]
                
                let auth = RPAuthorModel()
                auth.name = LCString(dic["name"] as! String)
                auth.desc = LCString(dic["desc"] as! String)
                auth.dynasty = LCString(type.rawValue)
                
                auth.save({ (result) in
                    if result.isSuccess == true {
                        print(auth.name?.stringValue as Any)
                        print("已上传" + "\(i)" + "/" + "\(authors.count)")
                    } else {
                        print("诗人上传失败")
                    }
                })
                
            }
            return authors
        } catch {
            print(error)
            return nil
        }
    }
    
    //获取作品列表
    
    
}
