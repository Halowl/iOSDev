//
//  TitleView.swift
//  PageView
//
//  Created by Adobe on 17/5/18.
//  Copyright © 2017年 龚. All rights reserved.
//

import UIKit


protocol TitleViewDelegate:class {
    func titleView(_ titleView:TitleView)
}


class TitleView: UIView {

    weak var delegate:TitleViewDelegate?
    fileprivate var titles:[String]
    fileprivate var pageStyle:PageStyle
    fileprivate var titleLabels:[UILabel] = [UILabel]()
    fileprivate lazy var scrollView :UIScrollView = {
       let scrollView = UIScrollView.init(frame: self.bounds)
       scrollView.showsVerticalScrollIndicator = false
       scrollView.showsHorizontalScrollIndicator = false
       scrollView.scrollsToTop = false
        
       return scrollView
    }()
    init(frame: CGRect ,titles:[String],pageStyle:PageStyle) {
        
        self.titles = titles
        self.pageStyle = pageStyle
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension TitleView{
    
    fileprivate func setupUI(){
        
        self.addSubview(scrollView)
        
        addLable()
        
        setupLabel()
        
        
    }
    
    private func addLable(){
        for (i,title) in titles.enumerated(){
            let label = UILabel()
            label.text = title
            label.tag = i
            label.font = pageStyle.titleFont
            label.textColor =  i == 0 ? pageStyle.selectColor : pageStyle.normalColor
            label.textAlignment = .center
            titleLabels.append(label)
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(titleLabelClick(_:)))
            label.addGestureRecognizer(tap)
            label.isUserInteractionEnabled = true
            scrollView.addSubview(label)
            
        }
    }
    
    private func setupLabel(){
        let count = titleLabels.count
        
        for (i,label) in titleLabels.enumerated(){
            
            var x : CGFloat = 0
            let y : CGFloat = 0
            var w : CGFloat = 0
            let h : CGFloat = bounds.height
            
            // 判断是否可以滚动
            if !pageStyle.isScrollEnable{
                w = bounds.width / CGFloat(count)
                x = w * CGFloat(i)
            }else{
                let size = CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: 0)  //max_folat
                w = (titles[i] as NSString).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [
                    NSFontAttributeName : pageStyle.titleFont], context: nil).width
                if x == 0{
                    x = pageStyle.titleMargin * 0.5
                }else{
                    let lastLabel = titleLabels[i - 1]
                    x = lastLabel.frame.maxX + pageStyle.titleMargin
                }
            }
            
            label.frame = CGRect.init(x: x, y: y, width: w, height: h)
        }
        
        scrollView.contentSize = CGSize.init(width:bounds.width, height: bounds.height)
        
    }
}


extension TitleView{
    
    @objc fileprivate func titleLabelClick(_ tap:UITapGestureRecognizer){
        let labe = tap.view as! UILabel
        labe.textColor = pageStyle.selectColor
        
        delegate?.titleView(self)
    
        
        
    }
}


extension TitleView : ContentViewDelegae{
    
    func contenView(_ contentView: ContentView, toIndex: CGFont) {
        
    }
}
