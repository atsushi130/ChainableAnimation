//
//  ChainableAnimation.swift
//  ChainableAnimation
//
//  Created by Atsushi Miyake on 2018/08/25.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import UIKit

final class ChainableAnimation {
    
    private var next: ChainableAnimation? = nil
    private var prev: ChainableAnimation? = nil
    
    var first: ChainableAnimation {
        var chainableAnimation = self
        while chainableAnimation.prev != nil {
            if let prev = chainableAnimation.prev {
                chainableAnimation = prev
            }
        }
        return chainableAnimation
    }
    
    var last: ChainableAnimation {
        var chainableAnimation = self
        while chainableAnimation.next != nil {
            if let next = chainableAnimation.next {
                chainableAnimation = next
            }
        }
        return chainableAnimation
    }
    
    typealias Animation = () -> Void

    private enum Animator {
        case basic(duration: TimeInterval, delay: TimeInterval, options: UIViewAnimationOptions, animation: Animation)
        case spring(duration: TimeInterval, delay: TimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions, animation: Animation)
    }
    
    private let animator: Animator
    
    private init(animator: Animator) {
        self.animator = animator
    }
}
