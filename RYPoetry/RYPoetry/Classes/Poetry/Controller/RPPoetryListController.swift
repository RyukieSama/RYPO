//
//  RPPoetryListController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/19.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPPoetryListController: RPBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueToReadPoetryDetail" {
            let vc = segue.destination as! RPReaderController
            vc.poetry = poetries[selectedIndex]
        }
    }

    // MARK: - UI
    @IBOutlet var tvMain: UITableView!
    
    private func setupUI() {
        tvMain.register(UINib.init(nibName: "RPPoetryListCell", bundle: nil), forCellReuseIdentifier: "RPPoetryListCell")
    }
    
    // MARK: - data
    private var poetries = [RPPoetryBaseModel]()
    private var selectedIndex = 0
    private func loadData() {
        if (dic.count == 0) {//加载全部
            RPPoetryHelper.sharedHelper.loadAllPoetry(callBack: { (poetryArr) in
                self.poetries = poetryArr as! [RPPoetryBaseModel]
                self.tvMain.reloadData()
            })
            return
        }
        
        //按卷号加载
        let volume = dic["volume"] as! Int64
        if volume > 0 {
            RPPoetryHelper.sharedHelper.loadPoetries(inVolume: volume) { (poetryArr) in
                print(poetryArr.count)
                self.poetries = poetryArr as! [RPPoetryBaseModel]
                self.tvMain.reloadData()
            }
            return
        }
        
        //按作者加载
        let author = dic["author"] as! String
        if author.count > 0 {
            RPPoetryHelper.sharedHelper.loadPoetries(ofAuthor: author) { (poetryArr) in
                print(poetryArr.count)
                self.poetries = poetryArr as! [RPPoetryBaseModel]
                self.tvMain.reloadData()
            }
            return
        }
        
    }
}

extension RPPoetryListController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poetries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RPPoetryListCell", for: indexPath) as! RPPoetryListCell
        cell.bindPoetryModel(poetry: poetries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
         performSegue(withIdentifier: "segueToReadPoetryDetail", sender: nil)
    }
}
