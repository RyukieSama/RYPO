//: Playground - noun: a place where people can play

import UIKit

// MARK: - Curring
//http://swifter.tips/currying/
//应该就是函数式编程的核心
func addTo(adder: Int) -> (Int) -> Int {
    return {
        num in
        return num + adder
    }
}

let baseFour = addTo(adder: 4)

let result = baseFour(6)


//protocol
//mutating 关键字  加了之后可以修改所属实例内的任何属性
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case On,Off
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}

var lightSiwch = OnOffSwitch.Off
lightSiwch.toggle()

//协议类型
class Dice {
    let sides: Int
    var generator: Togglable
    init(sides: Int, generator: Togglable) {
        self.sides = sides
        self.generator = generator
    }
    
    func switchOf() {
        generator.toggle()
    }
}

var dicee = Dice(sides: 1, generator: OnOffSwitch.Off)
dicee.generator
dicee.switchOf()
dicee.generator




