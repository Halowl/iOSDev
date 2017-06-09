//
//  HomeViewController.swift
//  POP
//
//  Created by Adobe on 2017/6/7.
//  Copyright © 2017年 龚. All rights reserved.
//

import UIKit

class  HomeViewController: UIViewController,TitlePortocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dog = Dog()
        dog.runing()
        dog.eat()
        
        
        self.setTitle()
        setupUI()
    }


}

extension HomeViewController{
    fileprivate func setupUI(){
        let view = TestView()
        view.setBackGroudColor()
    }
    
}
