//
//  ViewController.swift
//  SampleQiuz
//
//  Created by Shinya Yamamoto on 2016/05/15.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapSystemSoundButton(sender: AnyObject) {
        
        if #available(iOS 9.0, *) {
            AudioServicesPlaySystemSoundWithCompletion(1000){ () -> Void  in
                
            }
        } else {
            print("ios version is old")
        }
    }

    @IBAction func tapCustomSoundButton(sender: AnyObject) {
        
        var soundID : SystemSoundID = 0
        if let soundURL = NSBundle.mainBundle().URLForResource("custom", withExtension: "mp3") {
           
            AudioServicesCreateSystemSoundID(soundURL, &soundID)
            if #available(iOS 9.0, *) {
                AudioServicesPlaySystemSoundWithCompletion(soundID, { () -> Void in
                    
                })
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
    
    @IBAction func tapVibration(sender: AnyObject) {
        
        if #available(iOS 9.0, *) {
            AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate, { () -> Void in
                
            })
        } else {
            // Fallback on earlier versions
        }
    }
}

