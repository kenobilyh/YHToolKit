//
//  TransitionViewController.swift
//  YHToolKit
//
//  Created by Jeff Lin on 7/9/16.
//  Copyright © 2016 JeffLin. All rights reserved.
//

import Foundation
import UIKit

class TransitionViewController: UIViewController {
    var collectionView: UICollectionView?
    var animator: YHFocusAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
        let collectionViewFlowLayout = UICollectionViewFlowLayout.init()
        collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: collectionViewFlowLayout)
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.register(ImageCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(ImageCollectionViewCell.classForCoder()))
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        self.view.addSubview(collectionView!)
        
        self.view.addConstraint(NSLayoutConstraint.init(item: collectionView!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint.init(item: collectionView!, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint.init(item: collectionView!, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint.init(item: collectionView!, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0.0))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    
// MARK: UICollectionViewDataSource
extension TransitionViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    
    @objc(collectionView:cellForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ImageCollectionViewCell = collectionView .dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ImageCollectionViewCell.classForCoder()), for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = 0 == indexPath.row % 3 ? UIImage.init(named: "duck") : UIImage.init(named: "sunset")
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension TransitionViewController: UICollectionViewDelegate {
    @objc(collectionView:didSelectItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ImageCollectionViewCell
        if (self.animator == nil) {
            self.animator = YHFocusAnimator.init(sourceView: self.collectionView, toRect: self.view.frame, duration: 0.7)
        }
        let focusRect = cell.frame.squarelized().offsetBy(dx: -collectionView.contentOffset.x, dy: -collectionView.contentOffset.y)
        self.animator?.rectToFocus = focusRect
        let imagePage = ImageDisplayViewController.init()
        imagePage.displayImage = cell.imageView.image
        self.navigationController?.delegate = self
        self.navigationController?.pushViewController(imagePage, animated: true)
    }
}

// MARK : UICollectionViewDelegateFlowLayout

extension TransitionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let image = 0 == indexPath.row % 3 ? UIImage.init(named: "duck")! : UIImage.init(named: "sunset")!
        let cellSize = CGSize.init(width: image.size.width / 10.0,height: image.size.height / 10.0)
        return cellSize
    }
}

// MARK : UINavigationControllerDelegate
extension TransitionViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.animator?.operation = operation
        return animator
    }
}
