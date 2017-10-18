//
//  RPMainController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/17.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPMainController: RPBaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! RPBaseController
        if segue.identifier == segueDetail {
            vc.dic = ["title" : mainCellModels[currentIndex].title]
        }
    }
    
    //配置unwind segue
    @IBAction func unwindSegueAction(segue : UIStoryboardSegue) {
        if segue.identifier == "segueBackToMain" {
            print("segueBackToMain")
        }
    }
    
    // MARK: - UI
    
    @IBOutlet weak var cvMain: UICollectionView!
    
    private func setupUI() {
        view.backgroundColor = UIColor.gray
    }
    
    // MARK: - segueID
    let segueDetail = "segueToDetail"
    
    // MARK: - other
    var currentIndex = 0;
    let mainCellModels : [RPMainCellModel] = {
        
        var look = RPMainCellModel()
        look.titleL = "鉴\n赏"
        look.title = "鉴赏"
        
        var fight = RPMainCellModel()
        fight.titleL = "对\n诗"
        fight.title = "对诗"
        
        var travel = RPMainCellModel()
        travel.titleL = "游\n历"
        travel.title = "游历"
        
        var mine = RPMainCellModel()
        mine.titleL = "孤\n家\n寡\n人"
        mine.title = "孤家寡人"
        
        let arr = [look,fight,travel,mine]
        
        return arr
    }()
}

extension RPMainController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainCellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RPMainCell", for: indexPath) as! RPMainCell
        cell.bindCellModel(cellModel: mainCellModels[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        if indexPath.item == currentIndex {
            performSegue(withIdentifier: segueDetail, sender: nil)
        } else {
            //            collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let itemMargin = 250
        let index = Int((scrollView.contentOffset.x) / CGFloat(itemMargin))
        //        print(scrollView.contentOffset.x)
        print(index)
        currentIndex = index
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let itemMargin = 250
        let index = Int((scrollView.contentOffset.x) / CGFloat(itemMargin))
        //        print(scrollView.contentOffset.x)
        print(index)
        currentIndex = index
    }
    
}


