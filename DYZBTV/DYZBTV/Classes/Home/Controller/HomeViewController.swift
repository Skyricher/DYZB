//
//  HomeViewController.swift
//  DYZBTV
//
//  Created by 鲁俊 on 2016/9/23.
//  Copyright © 2016年 amao24.com. All rights reserved.
//

import UIKit

private let KTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {
    
    //MARK: -懒加载
      lazy var pageTitleView: PageTitleView = {
      
      let titleFrame = CGRect(x:0 , y: kNavitationBarH + kStatusBarH, width:KScreenW, height:KTitleViewH )
        
      let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        
      let titleView = PageTitleView(frame: titleFrame, titles: titles)

      return titleView
        
    }()
    
    lazy var pageContentView: PageContentView = { [weak self] in
        //1.确定内容视图的frame
        let contentH = KScrennH - kStatusBarH - kNavitationBarH - KTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavitationBarH + KTitleViewH, width: KScreenW, height: contentH)
        var childVcs = [UIViewController]()
        //2.确定子控制器
        for _ in 0 ..< 4{
         let vc = UIViewController()
         vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
           
         childVcs.append(vc)
         
        }
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewControll: self)
        
        return contentView
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //0.不需要调整 UIScrollView 的内边距
        automaticallyAdjustsScrollViewInsets = false
        
       
         //设置UI界面
         setupUI()
        
        
    }

 }


//MARK: -设置UI 界面
private extension HomeViewController {
    
     func setupUI(){
        //1.设置导航栏
        setupNavigationBar()
        
        //2.添加titleView
        view.addSubview(pageTitleView)
        //3.添加contentView
        view.addSubview(pageContentView)
        
        pageContentView.backgroundColor = UIColor.purple
    }
    
    func setupNavigationBar(){
        //设置左侧Item
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
       //设置右侧Item
        
        let size = CGSize(width: 40, height: 40)
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
      
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        let qcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)

        navigationItem.rightBarButtonItems = [historyItem,searchItem,qcodeItem]
    
    }

}
