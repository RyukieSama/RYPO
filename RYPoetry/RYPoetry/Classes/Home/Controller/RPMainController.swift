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
            vc.dic = ["title" : "详情"]
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
    let currentIndex = 0;
}

extension RPMainController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RPMainCell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        performSegue(withIdentifier: segueDetail, sender: nil)
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
    }
}


