//
//  YHFocusAnimator.swift
//  YHToolKit
//
//  Created by Jeff Lin on 7/10/16.
//  Copyright © 2016 JeffLin. All rights reserved.
//

import UIKit

class YHFocusAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var operation: UINavigationControllerOperation?
    var duration: TimeInterval?
    var rectToFocus: CGRect?
    let sourceView: UIView!
    let toRect: CGRect!
    
    init(sourceView: UIView!, toRect: CGRect!, duration: TimeInterval?) {
        self.sourceView = sourceView
        self.toRect = toRect
        super.init()
    }
    
    func transitionDuration(_ transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration > 0.0 ? self.duration! : 0.7
    }
    
    func animateTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewController(forKey: UITransitionContextToViewControllerKey)
        if .push == self.operation {
            sourceView.focusRect(self.rectToFocus!, toRect: self.toRect, duration: self.transitionDuration(transitionContext), options: [], completion: { (complete) in
                transitionContext.containerView().addSubview(toVC!.view)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            })
        } else {
            transitionContext.containerView().addSubview(toVC!.view)
            UIView.animate(withDuration: self.transitionDuration(transitionContext), animations: { 
                self.sourceView?.transform = CGAffineTransform.identity
                toVC?.view.setNeedsLayout()
                toVC?.view.layoutIfNeeded()
                }, completion: { (complete) in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                })
        }
    }
}
