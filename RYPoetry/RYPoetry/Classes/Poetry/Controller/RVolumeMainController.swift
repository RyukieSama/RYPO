//
//  RVolumeMainController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/10/19.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit

class RVolumeMainController: RPBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadVolumeData()
        // Do any additional setup after loading the view.
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
        let vc = segue.destination as! RPBaseController
        if segue.identifier == "segueVolumeToList" {
            vc.dic = ["volume" : selectedVolume]
        }
    }

    // MARK: - UI
    @IBOutlet weak var tvMain: UITableView!
    private func setupUI() {
        tvMain.register(UINib.init(nibName: "RPVolumeCell", bundle: nil), forCellReuseIdentifier: "RPVolumeCell")
    }
    
    // MARK: - data
    private var selectedVolume : Int64 = 0
    private var volumes = [RPPoetryVolumeModel]()
    private func loadVolumeData() {
        RPPoetryHelper.sharedHelper.loadVolumeList { (volumeArr) in
            print(volumeArr.count)
            self.volumes = (volumeArr as! [RPPoetryVolumeModel])
            self.tvMain.reloadData()
        }
    }
}

extension RVolumeMainController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (volumes.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RPVolumeCell", for: indexPath) as! RPVolumeCell
        cell.bindModel(volume: volumes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedVolume = Int64(indexPath.row + 1)
        performSegue(withIdentifier: "segueVolumeToList", sender: nil)
    }
    
}
