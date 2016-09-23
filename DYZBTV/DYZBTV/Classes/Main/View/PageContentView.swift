//
//  PageContentView.swift
//  DYZBTV
//
//  Created by 鲁俊 on 2016/9/23.
//  Copyright © 2016年 amao24.com. All rights reserved.
//

import UIKit

private let contentCellID = "contentCellID"

class PageContentView: UIView {
    
    //MARK: -懒加载
    internal lazy var  collectionView: UICollectionView = { [weak self] in
     
        //1创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        //2。创建 UICollectionView
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        collectionView.showsHorizontalScrollIndicator  = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:contentCellID )
        
        return collectionView
    }()
    
    //MARK: -定义属性
    internal var childVcs: [UIViewController]
   
    internal weak var parentViewController: UIViewController?
    
    
     //MARK:-自定义构造函数
    init(frame: CGRect, childVcs: [UIViewController], parentViewControll: UIViewController?) {
    
       self.childVcs = childVcs
       self.parentViewController = parentViewControll
       super.init(frame: frame)
      
        //设置 UI 界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -设置UI界面
private extension PageContentView{
    func setupUI(){
      
        //1.将所有的子控制器添加到父控制器中
        for childVc in childVcs {
        
             parentViewController?.addChildViewController(childVc)
        
        }
        
        //2.添加 UICollectionView,用于在 cell 中存放控制器的 View
        addSubview(collectionView)
        collectionView.frame = bounds
    }

}

//实现数据源方法
extension PageContentView: UICollectionViewDataSource{
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
         return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //创建 cell
         let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellID, for: indexPath)
        //给 cell 设置内容
        for view in cell.contentView.subviews{
         
            view.removeFromSuperview()
        }
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
       
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
    
}
