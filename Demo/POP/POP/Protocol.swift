//
//  Protocol.swift
//  POP
//
//  Created by Adobe on 2017/6/7.
//  Copyright © 2017年 龚. All rights reserved.
//

import UIKit
protocol RunProtocol {
    // MARK: - 这种需要自己实现方法
    func eat()
//    var name:String{get}
    
}
// MARK: - 任意的对象都可以使用此方法
extension RunProtocol{
    
    func runing(){
        print("runing")
    }
}

protocol BlackgroudColorProtocol {
    
}

// MARK: - 只有是UIView或者它的子类才能使用此方法
extension BlackgroudColorProtocol  where Self : UIView {
    
    func setBackGroudColor(){
        self.backgroundColor = UIColor.orange
         print(UIColor.orange)
    }
}

// MARK: - 只有是UIViewController或者它的子类才能使用协议
protocol TitlePortocol where Self : UIViewController {
    
}

extension TitlePortocol{
    func setTitle(){
        self.title = "JJAdobe"
        print("JJAdobe")
    }
}

