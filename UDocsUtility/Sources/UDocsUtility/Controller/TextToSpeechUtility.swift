//
//  TextToSpeechUtility.swift
//  TestTextToSpeech
//
//  Created by Kumar Muthaiah on 23/06/20.
//  Copyright © 2020 Kumar Muthaiah. All rights reserved.
//
//Copyright 2020 Kumar Muthaiah
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
import Foundation
import AVKit

public class TextToSpeechUtility {
    private var avs: AVSpeechSynthesizer?
    private var codeToTextDictionary: [String: String] = [
        "\\.": " dot ",
        "\\:": " collon ",
        "xcodeproj": "x code project",
        "\\/": " slash "]
    
    public init() {
        avs = AVSpeechSynthesizer()
    }
    /*
     textToSpeechUtility.speak(text: "Click on the + button under the \"Embedded Binaries\" section. Select the Alamofire.xcodeproj. Alamofire.framework https://github.com/Alamofire/Alamofire.git. rdar://21349340 - Compiler throwing warning due to toll-free bridging issue in test case. Name: Kumar", language: "en-US", rate: 0.4)
//        textToSpeechUtility.speak(text: "जब तक आपके अन्दर जुनून और विश्वास है और मेहनत के लिए तैयार हैं, तब तक दुनिया में आप कोई भी काम कर सकते हैं और कुछ भी पा सकते है| दोस्तों ज़िन्दगीं में किसी भी मंज़िल या मुकाम को पाने के लिए सबसे आवश्यक चीज़ आपकी मेहनत तथा आपका धैर्य है। अगर आप ईमानदारी ", language: "hi", rate: 0.4)
     
     */
    public func speak(text: String, language: String, rate: Float) {
        var modifiedText = text
        // First replace "." with " dot ". Then other codes or symbols with text
        for code in codeToTextDictionary {
            let regex = try! NSRegularExpression(pattern: code.key, options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, modifiedText.count)
            modifiedText = regex.stringByReplacingMatches(in: modifiedText, options: [], range: range, withTemplate: code.value)
            print(modifiedText)
        }
        // Replace miss replacedment of " dot  " with ". "
        let regex = try! NSRegularExpression(pattern: "[\\s]{1,}dot[\\s]{1,}[\\s]{1,}", options: NSRegularExpression.Options.caseInsensitive)
        let range = NSMakeRange(0, modifiedText.count)
        modifiedText = regex.stringByReplacingMatches(in: modifiedText, options: [], range: range, withTemplate: ". ")
        
        print(modifiedText)
        let utterance = AVSpeechUtterance(string: modifiedText)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = rate
        avs!.speak(utterance)
    }
}
