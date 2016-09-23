//
//  MainViewController.swift
//  DYZBTV
//
//  Created by 鲁俊 on 2016/9/22.
//  Copyright © 2016年 amao24.com. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let vc = UIViewController()
       
        vc.view.backgroundColor = UIColor.red
        
        addChildViewController(vc)

      
    }

   }
