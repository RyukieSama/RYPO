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
}

struct RPPoetryVolumeModel {
    var volume : Int64?
    var comment : String?
    var count : Int64?
}
