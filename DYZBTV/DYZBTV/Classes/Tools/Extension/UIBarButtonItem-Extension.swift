//
//  UIBarButtonItem-Extension.swift
//  DYZBTV
//
//  Created by 鲁俊 on 2016/9/23.
//  Copyright © 2016年 amao24.com. All rights reserved.
//

import UIKit

extension UIBarButtonItem{

   
    /*class func createItem(imageName:String, highImageName: String, size: CGSize)-> UIBarButtonItem{
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)
    
    
    }*/
    
    //遍历构造函数：1> convenience 开头， 2.在构造函数中必须明确调用一个设计构造函数（self）
    //构造函数不需要使用返回值
  convenience  init(imageName:String, highImageName: String = "", size: CGSize = CGSize.zero) {
        let btn = UIButton()
    
    //设置btn 图片
        btn.setImage(UIImage(named: imageName), for: .normal)
    if highImageName != "" {
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
       
        }
    //设置此尺寸
    if size == CGSize.zero{
       btn.sizeToFit()
      }else{
    
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
      }
        
    self.init(customView: btn)

    }
}
