//
//  PageView.swift
//  PageView
//
//  Created by Adobe on 17/5/18.
//  Copyright © 2017年 龚. All rights reserved.
//

import UIKit

class PageView: UIView {

    fileprivate var titles:[String]
    fileprivate var childVcs:[UIViewController]
    fileprivate var parentVc:UIViewController
    fileprivate var pageStyel:PageStyle
    
    init(frame: CGRect,titles:[String],childVcs:[UIViewController],parentVc :UIViewController,titleStyle:PageStyle) {
        
        self.titles = titles
        self.parentVc = parentVc
        self.childVcs = childVcs
        self.pageStyel =  titleStyle
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageView{
    
    fileprivate func setupUI(){
        let rect = CGRect.init(x: 0, y: 0, width: bounds.width, height: pageStyel.titleViewHeight)
        let titleView = TitleView.init(frame: rect, titles: titles, pageStyle:pageStyel )
        titleView.backgroundColor = UIColor.white
        addSubview(titleView)
        
        let frame = CGRect.init(x: 0, y: titleView.frame.maxY, width: bounds.width, height: bounds.height - rect.height)
        let contentView = ContentView.init(frame: frame, childVcs: childVcs, parentVc: parentVc)
        addSubview(contentView)
        contentView.delegate = titleView
        titleView.delegate = contentView
        
    }

    
}
