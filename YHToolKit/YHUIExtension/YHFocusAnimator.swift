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
        self.duration = duration
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        guard self.duration == nil else { return self.duration! }
        return TimeInterval(0.7)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        if .push == self.operation {
            sourceView.focusRect(self.rectToFocus!, toRect: self.toRect, duration: self.transitionDuration(using: transitionContext), options: [], completion: { (complete) in
                transitionContext.containerView.addSubview(toVC!.view)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        } else {
            transitionContext.containerView.addSubview(toVC!.view)
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                self.sourceView?.transform = CGAffineTransform.identity
                toVC?.view.setNeedsLayout()
                toVC?.view.layoutIfNeeded()
                }, completion: { (complete) in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                })
        }
    }
}
