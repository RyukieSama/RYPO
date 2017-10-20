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
        tvMain.register(UINib.init(nibName: "RPPoetryReadCell", bundle: nil), forCellReuseIdentifier: "RPPoetryReadCell")
    }
    
    // MARK: - data
    var poetry : RPPoetryBaseModel? {
        didSet {
            title = poetry?.title
        }
    }
}

extension RPReaderController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RPPoetryReadCell", for: indexPath)
        
        return cell
    }
}
