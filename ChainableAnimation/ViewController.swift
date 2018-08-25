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
            .animate(1.0) {
                self.animationView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }
            .springAnimate(0.5, dampingRatio: 0.4, velocity: 0.0, options: .curveEaseIn) {
                self.animationView.transform = CGAffineTransform.identity
            }
            .animate(1.5) {
                self.animationView.backgroundColor = UIColor.red
            }
            .animate(0.5) {
                self.animationView.backgroundColor = UIColor.gray
            }
            .start()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

