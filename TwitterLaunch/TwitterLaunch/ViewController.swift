//
//  ViewController.swift
//  TwitterLaunch
//
//  Created by 荣 Jason on 2017/11/16.
//  Copyright © 2017年 荣 Jason. All rights reserved.
//

import UIKit

let screenH = UIScreen.main.bounds.size.height

// MARK: - 工具类
extension CALayer {
    func w() -> CGFloat {
        return frame.size.width
    }
    
    func h() -> CGFloat {
        return frame.size.height
    }
}

// MARK: - 正文
class ViewController: UIViewController {
    @IBOutlet weak var contentV: UIImageView!
    
    lazy var maskLayer: CALayer = {
        let temp = CALayer()
        temp.bounds = CGRect(x: 0, y: 0, width: 120, height: 93);
        temp.contents = #imageLiteral(resourceName: "twitter logo mask").cgImage
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAnim()
    }
}

extension ViewController {
    fileprivate func setupUI () {
        view.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.6156862745, blue: 0.9098039216, alpha: 1)
        maskLayer.position = view.center
        contentV.layer.mask = maskLayer
    }
}

extension ViewController {
    fileprivate func setupAnim() {
        let anim = CAKeyframeAnimation(keyPath: "transform.scale")
        let begin = 1.0
        let middle = 0.8
        let end = screenH / min(maskLayer.w(), maskLayer.h()) * 3
        
        anim.beginTime = CACurrentMediaTime() + 0.5
        anim.duration = 1.5
        anim.values = [begin,middle,end]
        anim.keyTimes = [0,0.2,0.5]
        anim.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        anim.isRemovedOnCompletion = false
        anim.fillMode = kCAFillModeForwards
        maskLayer.add(anim, forKey: nil)
    }
}

