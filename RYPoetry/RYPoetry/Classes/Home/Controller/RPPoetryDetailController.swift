//
//  RPPoetryDetailController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/17.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPPoetryDetailController: UIViewController {

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
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - UI
    @IBOutlet weak var tvMain: UITableView!
    
    private func setupUI() {
        //tableView
        tvMain.register(UINib.init(nibName: "RPPoetryDetailCell", bundle: nil), forCellReuseIdentifier: "RPPoetryDetailCell")
    }
    
}

// MARK: - tv delegate & dataSource
extension RPPoetryDetailController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RPPoetryDetailCell", for: indexPath) as! RPPoetryDetailCell
        return cell
    }
    
}
