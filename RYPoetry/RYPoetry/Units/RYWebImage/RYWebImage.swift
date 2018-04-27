//
//  RYWebImage.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2018/4/12.
//  Copyright © 2018年 RyukieSama. All rights reserved.
//

/**
 Study onecat`s Kingfisher
 
 
 
 
 
 
 
 
 */

import Foundation

//根据不同版本进行类型映射
#if os(macOS)
    import AppKit
    public typealias RYImage = NSImage
    public typealias RYView = NSView
    public typealias RYColor = NSColor
    public typealias RYImageView = NSImageView
    public typealias RYButton = NSButton
#else
    import UIKit
    public typealias RYImage = UIImage
    public typealias RYColor = UIColor
    #if !os(watchOS)
        public typealias RYImageView = UIImageView
        public typealias RYView = UIView
        public typealias RYButton = UIButton
    #endif
#endif

public final class RYWebImage<RYBase> {
    public let base : RYBase
    public init(base: RYBase) {// (_ base: Base) KF 用的这种
        self.base = base
    }
}








