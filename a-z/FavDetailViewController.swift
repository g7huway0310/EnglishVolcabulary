//
//  FavDetailViewController.swift
//  a-z
//
//  Created by guowei on 2020/8/31.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit
import AVFoundation

class FavDetailViewController: UIViewController {

    @IBOutlet weak var vocSentence: UILabel!
    
    @IBOutlet weak var vocDetailLabel: UILabel!
    
    var vocDetail=[String]()
    
    var vocabularys=[String]()
    
    var vocabularyIndex=0
    
    var currentVoc: VocabularyCollection!
    
    var vocabularyFavs = [VocabularyCollection]()
    
    @IBOutlet weak var chineseSentance: UILabel!
    
    @IBOutlet weak var chineseVoc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        show()
        
        print(vocabularyFavs[vocabularyIndex].enSentences)
        print(vocabularyIndex)
        
        // Do any additional setup after loading the view.
    }
    
    
    func show(){
        vocDetailLabel.text=vocabularyFavs[vocabularyIndex].enVoc
        vocSentence.text=vocabularyFavs[vocabularyIndex].enSentences
        chineseVoc.text=vocabularyFavs[vocabularyIndex].chVoc
        chineseSentance.text=vocabularyFavs[vocabularyIndex].chSentences
   
    }
    
    @IBAction func speakVoc(_ sender: Any) {
        let speakVoc = AVSpeechUtterance(string: vocabularyFavs[vocabularyIndex].enVoc)
        let audio = AVSpeechSynthesizer()
        audio.speak(speakVoc)
    }
    
    @IBAction func switchToShowChinese(_ sender: UISwitch) {
        if sender.isOn{
            chineseVoc.isHidden=false
            chineseSentance.isHidden=false
        }else{
            chineseVoc.isHidden=true
            chineseSentance.isHidden=true
        }
    }
    

    @IBAction func speakSentence(_ sender: Any) {
        let speakSentence = AVSpeechUtterance(string: vocabularyFavs[vocabularyIndex].enSentences)
        let audio = AVSpeechSynthesizer()
        audio.speak(speakSentence)
    }
    
    @IBAction func nextVoc(_ sender: Any) {
        vocabularyIndex+=1
        if vocabularyIndex>vocabularyFavs.count-1{
        vocabularyIndex=0
    }
        show()
    }
    
    @IBAction func backIndex(_ sender: Any) {
        vocabularyIndex-=1
        if vocabularyIndex<0{
            vocabularyIndex=vocabularyFavs.count-1
        }
        show()
    }
    
}
