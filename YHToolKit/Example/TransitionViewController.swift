//
//  TransitionViewController.swift
//  YHToolKit
//
//  Created by Jeff Lin on 7/9/16.
//  Copyright © 2016 JeffLin. All rights reserved.
//

import Foundation
import UIKit

class TransitionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white()
        // Do any additional setup after loading the view, typically from a nib.
        let collectionViewFlowLayout = UICollectionViewFlowLayout.init()
        collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: collectionViewFlowLayout)
        collectionView?.backgroundColor = UIColor.clear()
//        collectionView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "CellIdentifier")
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
    
// MARK : UICollectionViewDataSource
extension TransitionViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    
    @objc(collectionView:cellForItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath)
        cell.backgroundColor = UIColor.init(red: CGFloat(indexPath.row) / 30.0, green: CGFloat(indexPath.row) / 50.0, blue: CGFloat(indexPath.row) / 70.0, alpha: 1.0)
        return cell
    }
}

// MARK : UICollectionViewDelegate
extension TransitionViewController {
    @objc(collectionView:didSelectItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !collectionView.transform.isIdentity {
            UIView.animate(withDuration: 1, animations: { 
                collectionView.transform = CGAffineTransform.identity
                self.view.setNeedsLayout()
                self.view.layoutIfNeeded()
            })
        } else {
            let cell = collectionView.cellForItem(at: indexPath)!
            collectionView.focusRect(cell.frame.offsetBy(dx: -collectionView.contentOffset.x, dy: -collectionView.contentOffset.y), toRect: self.view.frame, duration: 1, options: [])
        }
    }
}

// MARK : UICollectionViewDelegateFlowLayout
