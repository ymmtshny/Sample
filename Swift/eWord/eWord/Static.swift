//
//  Static.swift
//  eWord
//
//  Created by Shinya Yamamoto on 2016/06/26.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import Foundation
import AVFoundation

class Static:NSObject {
    
    //MARK: Text to Speech
    static func speachText(string: String) {
        
        let synth = AVSpeechSynthesizer()
        let engVoice = AVSpeechSynthesisVoice(language:"en-US")
        
        var myUtterance = AVSpeechUtterance(string: "")
        myUtterance = AVSpeechUtterance(string: string)
        myUtterance.rate = 0.5
        myUtterance.voice = engVoice
        synth.speakUtterance(myUtterance)
        
    }
    
}