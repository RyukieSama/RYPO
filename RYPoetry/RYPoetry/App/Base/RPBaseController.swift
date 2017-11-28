//
//  RPBaseController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/17.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPBaseController: UIViewController {

    typealias BaseVCClosures = (Any) -> ()
    
    var dic = [String : Any]()
    
    var baseClosure : BaseVCClosures?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rpBaseVCDoSomthing(someThing : Any) {
        print(someThing)
    }

    deinit {
        print(self,"===deinit===")
    }
    
    func routeWithSegue (identifier : String) {
        guard identifier.count > 0 else {
            print("segueId 有误")
            return
        }
        performSegue(withIdentifier: identifier, sender: nil)
    }

}
