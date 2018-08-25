//
//  ViewController.swift
//  ChainableAnimation
//
//  Created by Atsushi Miyake on 2018/08/25.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var animationView: UIView! {
        didSet {
            self.animationView.backgroundColor = UIColor.gray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ChainableAnimation
            .animate(duration: 1.0) {
                self.animationView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }
            .springAnimate(duration: 0.5, dampingRatio: 0.4, options: .curveEaseIn) {
                self.animationView.transform = CGAffineTransform.identity
            }
            .animate(duration: 1.5) {
                self.animationView.backgroundColor = UIColor.red
            }
            .animate(duration: 0.5) {
                self.animationView.backgroundColor = UIColor.gray
            }
            .start(repeat: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

