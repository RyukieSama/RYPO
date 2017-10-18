//
//  RPPoetryDetailController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/17.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RPPoetryDetailController: RPBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
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
    
    @IBAction func backClick(_ sender: Any) {
        performSegue(withIdentifier: "segueBackToMain", sender: nil)
    }
    private func setupUI() {
        title = dic["title"] as? String
        
        //tableView
        tvMain.register(UINib.init(nibName: "RPPoetryDetailCell", bundle: nil), forCellReuseIdentifier: "RPPoetryDetailCell")
    }
    
    // MARK: - segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetailSetting" {
            let vc = segue.destination as! RPBaseController
            vc.baseClosure = {(x) -> () in
                print(x)
            }
        }
    }
    
    // MARK: - data
    func loadData() {
        print(RPPoetryHelper().readData().count)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToDetailSetting", sender: nil)
    }
    
}
