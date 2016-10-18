//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {

    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addSubview(sun)
        self.view.addSubview(moon)
        self.view.addSubview(cloud)
        self.view.addSubview(lightning)
        
        changeBackgroundColor()
        setViews()
        showSun()

    }
    
    func setViews() {
        
        sun.center.y += view.frame.height
        sun.center.x += view.frame.width
        moon.center.y += view.frame.height
        moon.center.x += view.frame.width
        cloud.center.x = view.center.x
        cloud.center.y = view.center.y
        lightning.center.x = view.center.x
        lightning.center.y += cloud.center.y + 90
        lightning.alpha = 0.0
        cloud.alpha = 0.0

        buttonSetUp()
    }
    
    func buttonSetUp() {
        let cloudButton = UIButton(type: .system)
        cloudButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        cloudButton.isUserInteractionEnabled = true
        self.view.addSubview(cloudButton)
        cloudButton.translatesAutoresizingMaskIntoConstraints = false
        cloudButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cloudButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 200).isActive = true
        cloudButton.backgroundColor = UIColor.white
        cloudButton.layer.borderWidth = 5.0
        cloudButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func buttonPressed(sender: UIButton) {
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: .calculationModeLinear, animations: {
            self.cloud.alpha = 1.0
            
            UIView.addKeyframe(withRelativeStartTime: 1/6.0, relativeDuration: 1/6.0, animations: {
                self.lightning.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2/6.0, relativeDuration: 1/6.0, animations: {
                self.lightning.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 3/6.0, relativeDuration: 1/6.0, animations: {
                self.lightning.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 4/6.0, relativeDuration: 1/6.0, animations: {
                self.lightning.alpha = 0.0
            })

            UIView.addKeyframe(withRelativeStartTime: 5/6.0, relativeDuration: 1/6.0, animations: {
                self.lightning.alpha = 1.0
            })

            
            }, completion: nil)
        
    }
    
    func changeBackgroundColor() {

        UIView.animateKeyframes(withDuration: 20.0, delay: 0.0, options: [.allowUserInteraction, .repeat], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/4.0, animations: {
                self.view.backgroundColor = UIColor.cyan
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/4.0, relativeDuration: 1/4.0, animations: {
                self.view.backgroundColor = UIColor.blue
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2/4.0, relativeDuration: 1/4.0, animations: {
                self.view.backgroundColor = UIColor.black
            })
            
            UIView.addKeyframe(withRelativeStartTime: 3/4.0, relativeDuration: 1/4.0, animations: {
                self.view.backgroundColor = UIColor.blue
            })

            }, completion: nil)
    }
    
    func resetViews() {
        
        sun.center.x += (view.bounds.width * 2)
        moon.center.x += (view.bounds.width * 2)
    }
    
    func showSun() {

        UIView.animateKeyframes(withDuration: 10.0, delay: 0.0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/2.0, animations: {
                self.sun.center.x = self.view.center.x
                self.sun.center.y = self.view.center.y.multiplied(by: 0.25)
            })

            UIView.addKeyframe(withRelativeStartTime: 1/2.0, relativeDuration: 1/2.0, animations: {
                self.sun.center.y += self.view.bounds.height
                self.sun.center.x -= self.view.bounds.width
            })

            
        }) {completion in
            self.showMoon()
            self.resetViews()
        }

    }

    
    func showMoon() {
        
        UIView.animateKeyframes(withDuration: 10.0, delay: 0.0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/2.0, animations: {
                self.moon.center.x = self.view.center.x
                self.moon.center.y = self.view.center.y.multiplied(by: 0.25)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/2.0, relativeDuration: 1/2.0, animations: {
                self.moon.center.y += self.view.bounds.height
                self.moon.center.x -= self.view.bounds.width
            })
            
        }) {completion in
            self.showSun()
            self.resetViews()
        }
        
    }

    
    
}
