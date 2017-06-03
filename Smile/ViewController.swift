//
//  ViewController.swift
//  Smile
//
//  Created by Maxime Ravau on 31/05/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var buttonSmile: UIButton!
    
    @IBOutlet var buttonGo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSmile.alpha = 0
        buttonGo.alpha = 0
        
        showImage()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       
    
        func showImage(){
            
            UIView.animate(withDuration: 3, animations: {
                
                self.buttonSmile.alpha = 1
                
            }, completion: { (true) in
                
            self.imageRespire()
            
        })
            
    }

    func imageRespire(){
    
    UIView.animate(withDuration: 1.0, delay: 0, options: [.autoreverse, .repeat], animations: {
    
        self.buttonSmile.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        self.animationText()
        
    }, completion: { (true) in
        
        
        
    
        })
            
    }
    
    func animationText(){
        
        UIView.animate(withDuration: 3, animations: {
            
            self.buttonGo.alpha = 1
            self.buttonGo.layer.cornerRadius = 10
            self.buttonGo.layer.borderWidth = 1
            self.buttonGo.layer.borderColor = UIColor.brown.cgColor
            
        })
        
    }
    
}
