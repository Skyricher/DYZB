//
//  pageTitleView.swift
//  DYZBTV
//
//  Created by 鲁俊 on 2016/9/23.
//  Copyright © 2016年 amao24.com. All rights reserved.
//

import UIKit

private let kscrollLineH: CGFloat = 2

class PageTitleView: UIView {
    
    //MARK: -定义属性
     var titles: [String]
     var currentIndex: Int = 0
    
    //MARK: -懒加载

     internal lazy var titleLabels: [UILabel] = [UILabel]()
    
     internal lazy var scrollView: UIScrollView = {
    
         let scrollView = UIScrollView()
        
         scrollView.showsHorizontalScrollIndicator = false
         scrollView.scrollsToTop = false
         scrollView.bounces  = false
         scrollView.isPagingEnabled = false
 
         return scrollView

    }()
    
    lazy var scrollLine: UIView = {
     
         let scrollLine = UIView()
         scrollLine.backgroundColor = UIColor.orange
        
        return scrollLine
        
    }()
 
     //MARK: -自定义构造函数
    init(frame: CGRect, titles:[String]) {
        self.titles = titles
        
        super.init(frame:frame)
        //设置UI界面
         setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

}

private extension PageTitleView{
 
    func setupUI(){
        
        //1.添加scrollView
        addSubview(scrollView)
        
        scrollView.frame = bounds
        
        //2.添加title 对应的Label
        
        setupTitleLabels()
        
        //3.设置底线 和 滚动指示器
        setupBottomLineAndScrollLine()
       
        
    }
    
    func setupTitleLabels(){
        
        //0.确定label的一些frame
        let labelW: CGFloat = frame.width / CGFloat(titles.count)
        let labelH: CGFloat = frame.height - kscrollLineH
        let labelY: CGFloat = 0
        
        print(titles.count)

        for (index, title) in titles.enumerated(){
             //1.创建 UILabel
           let label = UILabel()
            
            //2.设置Label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            //3.设置Label 的frame
            let labelX: CGFloat = labelW * CGFloat(index)
            
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            //4.将Label 添加到 scrollView中
            scrollView.addSubview(label)
            //将label添加到数组
            titleLabels.append(label)
            
            //5.给label添加手势识别器
            label.isUserInteractionEnabled  = true
            
            let tapGes = UIGestureRecognizer(target: self, action: #selector(titleLabelClick(tapGes:)))
           
            label.addGestureRecognizer(tapGes)

 
        }
        
    }
   
    
    func setupBottomLineAndScrollLine() {
        //1.添加底线 (tapGes:)
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        //2.添加scrollViewLine
        
        //2.1获取第一个 Label
        guard let firstLabel = titleLabels.first else {return}
        firstLabel.textColor = UIColor.orange
        
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kscrollLineH, width: firstLabel.frame.width, height: kscrollLineH)
        scrollView.addSubview(scrollLine)
    }
}




//MARK: - 监听label点击
private extension PageTitleView {
    
      @objc func titleLabelClick(tapGes: UIGestureRecognizer){
        
        //1.获取当前 Label
        guard let currentLabel = tapGes.view as? UILabel else {
            return
        }
        
        //2.获取之前的 Label
        let oldLabel = titleLabels[currentIndex]
        
        //3.切换文字的颜色
        
        currentLabel.textColor = UIColor.orange
        oldLabel.textColor = UIColor.gray
       
        //4.保存最新 label 下标值
        currentIndex = currentLabel.tag
        
        //5.滚动条位置改变
        let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        
        UIView.animate(withDuration: 0.15) { 
            scrollLine.frame.origin.x = scrollLineX
        }
        
        
        
        
        
        
    }
    
}
