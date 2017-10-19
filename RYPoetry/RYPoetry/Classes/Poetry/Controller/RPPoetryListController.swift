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
    }

    // MARK: - UI
    @IBOutlet var tvMain: UITableView!
    
    private func setupUI() {
        tvMain.register(UINib.init(nibName: "RPPoetryListCell", bundle: nil), forCellReuseIdentifier: "RPPoetryListCell")
    }
    
    // MARK: - data
    private var poetries = [RPPoetryBaseModel]()
    private func loadData() {
        RPPoetryHelper.sharedHelper.loadAllPoetry { (poetryArr) in
            print(poetryArr.count)
            self.poetries = poetryArr as! [RPPoetryBaseModel]
            self.tvMain.reloadData()
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
}
