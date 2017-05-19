//
//  ViewController.swift
//  PageView
//
//  Created by Adobe on 17/5/18.
//  Copyright © 2017年 龚. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        
//        let titles:[String] = ["hello","lily","lucy","andy","yuby"]
        
        let titles:[String] = ["hello","lily","lucy","andy","yubry","leily","lucy","anddy","yaeuby","hello","lily","lucy","andy","yuby"]
        let style = PageStyle()
        style.titleViewHeight = 44
        style.isScrollEnable = true
        var childVcs:[UIViewController] =  [UIViewController]()
        for _ in  0..<titles.count{
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.randomColor()
            childVcs.append(vc)
        }
        
        let frame =  CGRect.init(x: 0, y: 64, width: view.bounds.width, height: view.bounds.height - 64)

        let pageView = PageView.init(frame: frame, titles: titles, childVcs: childVcs, parentVc: self, titleStyle: style)
        view.addSubview(pageView)
    }
    


}

extension ViewController{

    
}

