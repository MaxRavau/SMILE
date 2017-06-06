//
//  InterfaceController.swift
//  Smile WatchKit Extension
//
//  Created by Maxime Ravau on 31/05/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var labelScore: WKInterfaceLabel!
    @IBOutlet var image: WKInterfaceImage!
    var scoreActuel = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        
    }
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        
        
        
        
        super.didDeactivate()
    }
    @IBAction func buttonSourire() {
        
        
        
        scoreActuel += 1
        
        labelScore.setText("\(scoreActuel)")
        
        print("le score est de \(scoreActuel)")
        image.setAlpha(1)
        
        saveHighScore()
        
    }
    @IBAction func buttonReset() {
        
        debutJeu()
        
    }
    
    func debutJeu(){
        
        
        scoreActuel = 0
        image.setAlpha(0)
        labelScore.setText("\(scoreActuel)")
        
        
    }
    
    
    
    func saveHighScore() {
        UserDefaults.standard.set(scoreActuel, forKey: "Score")
        
        print("sauvegarder")
    }
    
       
}
