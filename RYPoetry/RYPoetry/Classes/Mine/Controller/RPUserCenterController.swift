//
//  RPUserCenterController.swift
//  RYPoetry
//
//  Created by 王荣庆 on 2017/11/29.
//  Copyright © 2017年 RyukieSama. All rights reserved.
//

import UIKit
import GameKit
import Photos
import LeanCloud
import AVOSCloud
import Kingfisher

class RPUserCenterController: RPBaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadUserData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    // MARK: - function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true) {
        }
    }
    
    private func loadUserData() {
        lbNickName.text = RPUser.rpCurrentUser().nickName?.stringValue;
        btUser.setTitle("", for: .normal)
        btUser.backgroundColor = UIColor.gray
        
        //TODO: 切换用户也要处理
        RPLocalPlayer.loadPhoto(for: .normal) { (image, error) in            
            if image != nil {
                self.btUser.setImage(image, for: .normal)
            }
            
            if error != nil {
                print(error!)
            }
        }
    }

    // MARK: - ACTION
    @IBAction func gameCenterClick(_ sender: Any) {
        let vc = GKGameCenterViewController()
        vc.gameCenterDelegate = self
        present(vc, animated: true) {
            
        }
    }
    
    // MARK: - FUNCTION
    private func showImagePicker() {
        present(imagePicker, animated: true) {
            
        }
    }
    
    private func updateUserAvatar(image : UIImage) {
        let imageData = UIImagePNGRepresentation(image)
        let file = AVFile(data: imageData!)
        file.saveInBackground { (flag, error) in
            if error == nil {
                print(error as Any)
            }
            print(file.url as Any)
        }
        
        btUser.setImage(image, for: .normal)
    }
    
    // MARK: -  UI
    @IBOutlet weak var btUser: UIButton!
    @IBOutlet weak var lbNickName: UILabel!
    private lazy var imagePicker : UIImagePickerController = {
        let vc = UIImagePickerController()
        vc.delegate = self
        return vc
    }()
    @IBOutlet weak var tfNickName: UITextField!
    @IBOutlet weak var btNickNameCommit: UIButton!
    
    private func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let url = URL(string:"http://ac-XNiw5AEe.clouddn.com/ocZuF4Id49GUgPzjdMv5BQC")
        btUser.kf.setImage(with: url, for: .normal)
        
    }
    
    @IBAction func avatarClick(_ sender: Any) {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == .authorized {
                    self.showImagePicker()
                }
            })
            break
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            showImagePicker()
            break
        }
        
    }
    
    @IBAction func nickNameCommit(_ sender: Any) {
        let text = tfNickName.text
        
        guard text?.count != 0 else {
            return
        }
        
        let currentUser = RPUser.rpCurrentUser()
        currentUser.nickName = LCString(text!)
        
        currentUser.save { result in
            switch result {
            case .success:
                self.lbNickName.text = text
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}

extension RPUserCenterController : GKGameCenterControllerDelegate,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
 {
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true) {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        updateUserAvatar(image: image!)
        
        imagePicker.dismiss(animated: true, completion: {
            
        })
    }
    
}
