//
//  PageStyle.swift
//  PageView
//
//  Created by Adobe on 17/5/18.
//  Copyright © 2017年 龚. All rights reserved.
//

import UIKit

class PageStyle {
    var titleViewHeight : CGFloat = 44
    var titleFont : UIFont =  UIFont.systemFont(ofSize: 14)
    var isScrollEnable : Bool = false
    
    var titleMargin : CGFloat = 20
    
    var normalColor : UIColor = UIColor(r: 255, g: 255, b: 255)
    var selectColor : UIColor = UIColor(r: 255, g: 127, b: 0)
    
    var bottomLineBackgroundColor = UIColor.red
    var bottomLineHeight : CGFloat = 2
    var bottomLineIsShow : Bool = true
    
    var isTitleScale : Bool = false
    var scaleRange  : CGFloat = 1.2
    
    var isShowCoverView : Bool = false
    var coverBgColor : UIColor =  UIColor.randomColor()
    var coverAlpah : CGFloat = 0.4
    var coverMargin : CGFloat = 8
    var coverHeight : CGFloat = 25
}


