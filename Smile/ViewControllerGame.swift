//
//  ViewControllerGame.swift
//  Smile
//
//  Created by Maxime Ravau on 03/06/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerGame: UIViewController {

    @IBOutlet var labelScore: UILabel!
    @IBOutlet var imageSmile: UIImageView!
    @IBOutlet var buttonSmileCustom: UIButton!
    @IBOutlet var buttonResertCustom: UIButton!
    
    var scoreActuel = 0
    
    
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        debutJeu()
        
        custombutton()
        
        let sound = Bundle.main.path(forResource: "1484", ofType: "wav")!
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
    }
    
    func custombutton(){
        
        buttonSmileCustom.layer.cornerRadius = 10
        buttonSmileCustom.layer.borderWidth = 1
        buttonSmileCustom.layer.borderColor = UIColor.black.cgColor
        
        buttonResertCustom.layer.cornerRadius = 10
        buttonResertCustom.layer.borderWidth = 1
        buttonResertCustom.layer.borderColor = UIColor.black.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonSmile(_ sender: Any) {
        
        scoreActuel += 1
        
        labelScore.text = "\(scoreActuel)"
        
        audioPlayer.play()
        
        imageSmile.alpha = 1
        
        saveHighScore()
        
            
    }
    
    
  
    @IBAction func buttonResert(_ sender: Any) {
        
        debutJeu()
    
        buttonResertCustom.shake()
        
    }
    
    func debutJeu(){
        
        scoreActuel = 0
        
        labelScore.text = "\(scoreActuel)"
        
        imageSmile.alpha = 0
        
        
        
    }
    
    func saveHighScore() {
        UserDefaults.standard.set(scoreActuel, forKey: "Score")
        
        print("sauvegarder")
    }

    
}

extension UIButton {
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
}
