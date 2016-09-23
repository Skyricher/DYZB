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
    //添加子控制器方法
    private func addChildVc(storyName: String){
       
        
        //1.通过storyboard获取控制器
        guard let childVc = UIStoryboard(name: storyName, bundle:nil).instantiateInitialViewController()
            
            else {
             //如果不存在直接返回
              return
         
               }
        //2.将childVc 作为子控制器
        addChildViewController(childVc)

    }

   
}
