//
//  BaseViewController.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 23.09.2022.
//

import UIKit
import Lottie
class BaseVC: UIViewController {
    var child: AnimationViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "OMBD Movies"
    }
    
    func startAnimating(animationName: Animations) {
        child = AnimationViewController(animationName: animationName)
        if let child = child {
            addChild(child)
            view.addSubview(child.view)
            child.view.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(150)
                make.size.equalTo(CGSize(width: 150, height: 250))
            }
            child.didMove(toParent: self)
        }
    }

    func stopAndHideAnimation() {
        child?.willMove(toParent: nil)
        child?.view.removeFromSuperview()
        child?.removeFromParent()
        child?.stopAnimation()
    }
    
    func makePush(toView : UIViewController){
        self.navigationController?.pushViewController(toView, animated: true)
    }
    
    func makePop(){
        self.navigationController?.popViewController(animated: true)
    }
}
