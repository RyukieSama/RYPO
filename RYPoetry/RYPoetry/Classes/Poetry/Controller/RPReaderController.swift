//
//  RPReaderController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/20.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPReaderController: RPBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI
    @IBOutlet weak var tvMain: UITableView!
    private func setupUI() {
        tvMain.separatorStyle = UITableViewCellSeparatorStyle.none
        tvMain.tableFooterView = UIView.init()
        tvMain.register(UINib.init(nibName: "RPPoetryReadCell", bundle: nil), forCellReuseIdentifier: "RPPoetryReadCell")
        tvMain.register(UINib.init(nibName: "RPPoetryInfoCell", bundle: nil), forCellReuseIdentifier: "RPPoetryInfoCell")
    }
    
    // MARK: - data
    var poetryLines : [String]?
    var poetry : RPPoetryBaseModel? {
        didSet {
            title = poetry?.title
            poetryLines = poetry?.lines
        }
    }
}

extension RPReaderController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (poetryLines?.count)! + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RPPoetryInfoCell", for: indexPath) as! RPPoetryInfoCell
            cell.bindPoetry(poetry: poetry!)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "RPPoetryReadCell", for: indexPath) as! RPPoetryReadCell
        cell.bindText(text: (poetryLines?[indexPath.row-1])!)
        return cell
    }
    
}
