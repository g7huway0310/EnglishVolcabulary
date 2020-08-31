//
//  EnglishViewController.swift
//  a-z
//
//  Created by guowei on 2020/8/30.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit
import AVFoundation



class EnglishViewController: UIViewController {
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var vocabularyLabel: UILabel!
    
    @IBOutlet weak var vocabularySentences: UILabel!
    
    @IBOutlet weak var speaker: UIButton!
    
    var alphalbet=""
    
     var isSelect=false
    
    var vocDetail=[String]()
    
    var vocabularys=[String]()
    
    var vocabularyIndex=0
    
    var currentVoc: VocabularyCollection!
    
    var vocabularyFavs = [VocabularyCollection]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem()
        backItem.title = alphalbet
        self.navigationItem.backBarButtonItem = backItem
        
        let asset=NSDataAsset(name: alphalbet)
        if let data=asset?.data{
            let content=String(data: data, encoding: .utf16)
            if let lines=content?.components(separatedBy: "\n"){
                vocabularys=lines
            }
        }
        readFav()
        show()
        
    }
    
    func show(){
        
        let vocabulary=vocabularys[vocabularyIndex]
        //顯示例句用t分開
        vocDetail=vocabulary.components(separatedBy: "\t")
        
        vocabularyLabel.text=vocDetail[0] //單字
        self.vocabularySentences.text=vocDetail[2] //例句
    }
    
    
    @IBAction func nextVoc(_ sender: Any) {
        vocabularyIndex+=1
        if vocabularyIndex>vocabularys.count-1{
            vocabularyIndex=0
        }
        show()
    }
    
    @IBAction func backVoc(_ sender: Any) {
        vocabularyIndex-=1
        if vocabularyIndex<0{
            vocabularyIndex=vocabularys.count-1
        }
        show()
    }
    
    
    @IBAction func speakVoc(_ sender: Any) {
       let wordAudio = AVSpeechUtterance(string: vocDetail[0])
       let audio = AVSpeechSynthesizer()
       audio.speak(wordAudio)
    }
    
    @IBAction func speakSentence(_ sender: Any) {
        let wordAudio = AVSpeechUtterance(string: vocDetail[2])
        let audio = AVSpeechSynthesizer()
        audio.speak(wordAudio)
        
    }
    
    @IBAction func collectVoc(_ sender: Any) {
        
        
        if isSelect==false{
        favButton.setImage(UIImage(systemName:"heart.fill"), for: .normal)
        isSelect=true
        }else{
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
       currentVoc=VocabularyCollection(enVoc: vocDetail[0], chVoc: vocDetail[1], enSentences: vocDetail[2], chSentences: vocDetail[3])
       
       vocabularyFavs.insert(currentVoc, at: 0)
        
       
        
       VocabularyCollection.saveToFile(vocabularyFavs: vocabularyFavs)
        
       saveToFileAlert()
        
    }
    
    func readFav(){
        if let vocabularyFavs = VocabularyCollection.readFromFile() {
        self.vocabularyFavs = vocabularyFavs
        }
    }
    
   func saveToFileAlert () {
        let controller = UIAlertController(title: "儲存成功", message: "已將單字收藏", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(action)
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func EnToChinese(_ sender: Any) {
        performSegue(withIdentifier: "goToChineseVer", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        let chineseVC=navigationController.topViewController as! ChineseViewController
        chineseVC.vocabulary=vocDetail[0]
        chineseVC.vocabularyTranslate=vocDetail[1]
        chineseVC.vocDetailTranslate=vocDetail[3]
        chineseVC.alphalbet=alphalbet
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
