//
//  TitleView.swift
//  PageView
//
//  Created by Adobe on 17/5/18.
//  Copyright © 2017年 龚. All rights reserved.
//

import UIKit


protocol TitleViewDelegate:class {
    func titleView(_ titleView:TitleView ,index :Int)
}


class TitleView: UIView {

    weak var delegate:TitleViewDelegate?
    fileprivate var lastLabel : UILabel = UILabel()
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
    
    fileprivate lazy var bottomLine :UIView = {
        let bottomLine = UIView()
        bottomLine.backgroundColor = self.pageStyle.bottomLineBackgroundColor
        bottomLine.frame.origin.y = self.bounds.height - self.pageStyle.bottomLineHeight
        bottomLine.frame.size.height = self.pageStyle.bottomLineHeight
        return bottomLine
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
        
        setupBottomLine()
        
    }
    
    private func addLable(){
        for (i,title) in titles.enumerated(){
            let label = UILabel()
            label.text = title
            label.tag = i
            label.font = pageStyle.titleFont
            label.textColor =  i == 0 ? pageStyle.selectColor : pageStyle.normalColor
            if i == 0 {
                lastLabel =  label
            }
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
                let size = CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: 0)  //maxfolat  CGFloat.greatestFiniteMagnitude
                w = (titles[i] as NSString).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [
                    NSFontAttributeName : pageStyle.titleFont], context: nil).width
                if i == 0{
                    x = pageStyle.titleMargin * 0.5
                }else{
                    let lastLabel = titleLabels[i - 1]
                    x = lastLabel.frame.maxX + pageStyle.titleMargin
                }
            }
            label.frame = CGRect.init(x: x, y: y, width: w, height: h)
            
        }
        
        if pageStyle.isTitleScale && titleLabels.first == lastLabel{
            lastLabel.transform = CGAffineTransform.init(scaleX: pageStyle.scaleRange, y: pageStyle.scaleRange)
        }
        if pageStyle.isScrollEnable{
            scrollView.contentSize.width = titleLabels.last!.frame.maxX + pageStyle.titleMargin * 0.5
        }
        

    }
    
    
    private func setupBottomLine(){
    
        scrollView.addSubview(bottomLine)
        setupBottomLineFrame()
//        bottomLine.frame.origin.x = titleLabels.first!.frame.origin.x
//        bottomLine.frame.size.width = titleLabels.first!.bounds.width
    }
    
    @objc fileprivate func setupBottomLineFrame(){
        let x = lastLabel.frame.origin.x
        let y = bounds.height - pageStyle.bottomLineHeight
        let w = lastLabel.frame.width
        let h =  pageStyle.bottomLineHeight
        bottomLine.frame = CGRect.init(x: x, y: y, width: w, height: h)
    }
}


extension TitleView{
    
    @objc fileprivate func titleLabelClick(_ tap:UITapGestureRecognizer){
        let label = tap.view as! UILabel
        label.textColor = pageStyle.selectColor
        lastLabel.textColor = pageStyle.normalColor
        if pageStyle.isTitleScale{
            label.transform = lastLabel.transform
            lastLabel.transform =  CGAffineTransform.identity
        }
        lastLabel = label
        
        delegate?.titleView(self, index: label.tag)
        
        
        // 3.调整BottomLine
        if pageStyle.bottomLineIsShow {
            setupBottomLineFrame()
        }
        
    
        guard pageStyle.isScrollEnable else { return }
        var offsetX = label.center.x - scrollView.bounds.width * 0.5
        
        if offsetX < 0 {
            offsetX = 0
        }
        let maxOffset = scrollView.contentSize.width - bounds.width
        if offsetX > maxOffset {
            offsetX = maxOffset
        }
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)

      
        
    }
}

// MARK: - 滑动contentView的时候切换title
extension TitleView : ContentViewDelegae{
    
     func contentView(_ contentView : ContentView , index : Int ) {
        
        let currentLable = titleLabels[index]
        lastLabel.textColor = pageStyle.normalColor
        currentLable.textColor = pageStyle.selectColor
        lastLabel = currentLable

        
        guard pageStyle.isScrollEnable else { return }
        var offsetX = currentLable.center.x - scrollView.bounds.width * 0.5
        
        if offsetX < 0 {
            offsetX = 0
        }
        let maxOffset = scrollView.contentSize.width - bounds.width
        if offsetX > maxOffset {
            offsetX = maxOffset
        }
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
       
    }
    
    func contenView(_ contentView : ContentView ,index : Int , progress : CGFloat){
        // 1.取出两个Label
        
        let newLabel = titleLabels[index]

        // 2.渐变文字颜色
        let selectRGB = getGRBValue(pageStyle.selectColor)
        let normalRGB = getGRBValue(pageStyle.normalColor)
        let deltaRGB = (selectRGB.0 - normalRGB.0, selectRGB.1 - normalRGB.1, selectRGB.2 - normalRGB.2)
        lastLabel.textColor = UIColor(r: selectRGB.0 - deltaRGB.0 * progress, g: selectRGB.1 - deltaRGB.1 * progress, b: selectRGB.2 - deltaRGB.2 * progress)
        newLabel.textColor = UIColor(r: normalRGB.0 + deltaRGB.0 * progress, g: normalRGB.1 + deltaRGB.1 * progress, b: normalRGB.2 + deltaRGB.2 * progress)
        
        
        // 3.渐变BottomLine
        if pageStyle.bottomLineIsShow {
            let deltaX = newLabel.frame.origin.x - lastLabel.frame.origin.x
            let deltaW = newLabel.frame.width - lastLabel.frame.width
            bottomLine.frame.origin.x = lastLabel.frame.origin.x + deltaX * progress
            bottomLine.frame.size.width = lastLabel.frame.width + deltaW * progress
        }
        
        if pageStyle.isTitleScale{
            let deltaScale = pageStyle.scaleRange - 1.0
            lastLabel.transform = CGAffineTransform(scaleX: pageStyle.scaleRange - deltaScale * progress, y: pageStyle.scaleRange - deltaScale * progress)
            newLabel.transform = CGAffineTransform(scaleX: 1.0 + deltaScale * progress, y: 1.0 + deltaScale * progress)
        }

    }
    
    private func getGRBValue(_ color : UIColor) -> (CGFloat, CGFloat, CGFloat) {
        guard  let components = color.cgColor.components else {
            fatalError("文字颜色请按照RGB方式设置")
        }
        
        return (components[0] * 255, components[1] * 255, components[2] * 255)
    }
}
