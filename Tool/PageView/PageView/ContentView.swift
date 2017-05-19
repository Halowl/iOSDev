
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
    
    func contenView(_ contentView : ContentView ,index : Int , progress : CGFloat)
    
    func contentView(_ contentView : ContentView , index : Int )
}

class ContentView: UIView {

    weak var delegate : ContentViewDelegae?
    
    fileprivate var isForbidDelegate : Bool = false
    fileprivate var startOffsetX : CGFloat = 0
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        collectionViewEndScroll()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate{
            collectionViewEndScroll()
        }
    }
    
    private func collectionViewEndScroll(){
        
        let  index =  Int(collectionView.contentOffset.x / collectionView.bounds.width)
        delegate?.contentView(self, index: index)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        isForbidDelegate = false
        startOffsetX = scrollView.contentOffset.x
    }

    // MARK: - 判断左右偏移
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == startOffsetX || isForbidDelegate { return }
        
        // 1.定义目标的index、进度
        var targetIndex : Int = 0
        var progress : CGFloat = 0
        
        // 2.判断用户是左滑还是右滑
        if scrollView.contentOffset.x > startOffsetX { // 左滑
            targetIndex = Int(startOffsetX / scrollView.bounds.width) + 1
            if targetIndex >= childVcs.count {
                targetIndex = childVcs.count - 1
            }
            progress = (scrollView.contentOffset.x - startOffsetX) / scrollView.bounds.width
        } else { // 右滑
            targetIndex = Int(startOffsetX / scrollView.bounds.width) - 1
            if targetIndex < 0 {
                targetIndex = 0
            }
            progress = (startOffsetX - scrollView.contentOffset.x) / scrollView.bounds.width
        }
        
        // 3.将数据传递给titleView
        delegate?.contenView(self, index: targetIndex, progress: progress)
        
    }
    
   
    
}

// MARK: - 点击title的时候切换contentView
extension ContentView: TitleViewDelegate{
    
    func titleView(_ titleView: TitleView , index :Int) {

        isForbidDelegate = true
        let indexPath = NSIndexPath.init(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: .left, animated: false)
        
        
        
    }
}
