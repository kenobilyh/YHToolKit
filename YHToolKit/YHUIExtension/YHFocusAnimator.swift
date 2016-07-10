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
    
    func transitionDuration(_ transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewController(forKey: UITransitionContextToViewControllerKey)
        if .push == self.operation {
            transitionContext.containerView().addSubview(toVC!.view)
        } else {
            transitionContext.containerView().addSubview(toVC!.view)
        }
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
    }
}
