
//
//  ContentView.swift
//  PageView
//
//  Created by Adobe on 17/5/18.
//  Copyright © 2017年 龚. All rights reserved.
//

import UIKit

private let KcollectionViewCell = "KcollectionViewCell"

protocol ContentViewDelegae: class {
    
    func contenView(_ contentView:ContentView ,toIndex:CGFont)
}

class ContentView: UIView {

    weak var delegate : ContentViewDelegae?

    fileprivate var childVcs:[UIViewController]
    fileprivate var parenetVc:UIViewController
    fileprivate var pageStyle:PageStyle = PageStyle()
    fileprivate lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: KcollectionViewCell)
        collectionView.bounces =  false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollsToTop = false
        return collectionView
    }()
    
     init(frame: CGRect,childVcs:[UIViewController],parentVc:UIViewController) {
        
        self.childVcs = childVcs
        self.parenetVc = parentVc
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContentView{
    
    fileprivate func setupUI(){
        for vc in childVcs{
            parenetVc.addChildViewController(vc)
        }
        addSubview(collectionView)
    }
    
}


extension ContentView:UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KcollectionViewCell, for: indexPath)
       
        
        for subView in cell.contentView.subviews{
            subView.removeFromSuperview()
        }
        cell.backgroundColor = UIColor.randomColor()
        
        let vc = childVcs[indexPath.item]
        vc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(vc.view)
        
        return cell
    }
    
}

extension ContentView:UICollectionViewDelegate{
    
    
    
}

extension ContentView: TitleViewDelegate{
    func titleView(_ titleView: TitleView) {
        
    }
}
