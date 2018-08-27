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
    
    private var first: ChainableAnimation {
        var chainableAnimation = self
        while chainableAnimation.prev != nil {
            if let prev = chainableAnimation.prev {
                chainableAnimation = prev
            }
        }
        return chainableAnimation
    }
    
    private var last: ChainableAnimation {
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
    
    static func animate(duration: TimeInterval,
                        delay: TimeInterval = 0.0,
                        options: UIViewAnimationOptions = [],
                        animation: @escaping Animation) -> ChainableAnimation {
        let animator = Animator.basic(duration: duration, delay: delay, options: options, animation: animation)
        return ChainableAnimation(animator: animator)
    }
    
    static func springAnimate(duration: TimeInterval,
                              delay: TimeInterval = 0.0,
                              dampingRatio: CGFloat = 0.5,
                              velocity: CGFloat = 0.0,
                              options: UIViewAnimationOptions = [],
                              animation: @escaping Animation) -> ChainableAnimation {
        let animator = Animator.spring(duration: duration,
                                       delay: delay,
                                       dampingRatio: dampingRatio,
                                       velocity: velocity,
                                       options: options,
                                       animation: animation)
        return ChainableAnimation(animator: animator)
    }
    
    func animate(duration: TimeInterval,
                 delay: TimeInterval = 0.0,
                 options: UIViewAnimationOptions = [],
                 animation: @escaping Animation) -> ChainableAnimation {
        let next = ChainableAnimation.animate(duration: duration, delay: delay, options: options, animation: animation)
        next.prev = self
        self.next = next
        return next
    }
    
    func springAnimate(duration: TimeInterval,
                       delay: TimeInterval = 0.0,
                       dampingRatio: CGFloat = 0.5,
                       velocity: CGFloat = 0.0,
                       options: UIViewAnimationOptions = [],
                       animation: @escaping Animation) -> ChainableAnimation {
        let next = ChainableAnimation.springAnimate(duration: duration,
                                                    delay: delay,
                                                    dampingRatio: dampingRatio,
                                                    velocity: velocity,
                                                    options: options,
                                                    animation: animation)
        next.prev = self
        self.next = next
        return next
    }
    
    private func animate(repeat: Bool) {
        switch self.animator {
        case let .basic(duration, delay, options, animation):
            UIView.animate(withDuration: duration, delay: delay, options: options, animations: animation) { [weak self] _ in
                if let next = self?.next {
                    next.animate(repeat: `repeat`)
                } else if `repeat` {
                    self?.first.animate(repeat: `repeat`)
                }
            }
        case let.spring(duration, delay, dampingRatio, velocity, options, animation):
            UIView.animate(withDuration: duration,
                           delay: delay,
                           usingSpringWithDamping: dampingRatio,
                           initialSpringVelocity: velocity,
                           options: options,
                           animations: animation) { [weak self] _ in
                if let next = self?.next {
                    next.animate(repeat: `repeat`)
                } else if `repeat` {
                    self?.first.animate(repeat: `repeat`)
                }
            }
        }
    }
    
    func start(repeat: Bool = false) {
        self.first.animate(repeat: `repeat`)
    }
}
