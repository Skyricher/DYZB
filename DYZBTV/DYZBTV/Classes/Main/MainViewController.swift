//
//  MainViewController.swift
//  DYZBTV
//
//  Created by 鲁俊 on 2016/9/23.
//  Copyright © 2016年 amao24.com. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        addChildVc(storyName: "Home")
        addChildVc(storyName: "Live")
        addChildVc(storyName: "Follow")
        addChildVc(storyName: "Profile")
    
    }
    
    private func addChildVc(storyName: String){
    
        //1.通过storyboard获取控制器
        
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        //2.将childVc 作为子控制器
        
        addChildViewController(childVc)
        

        
    }

   
}
