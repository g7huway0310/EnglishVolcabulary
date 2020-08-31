//
//  ChineseViewController.swift
//  a-z
//
//  Created by guowei on 2020/8/31.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class ChineseViewController: UIViewController {
    
    var alphalbet=""
    
    var vocDetailTranslate=""
    
    var vocabularyTranslate=""
    
    var vocabulary=""
    
    var vocabularyIndex=0

    @IBOutlet weak var vocabularyLabel: UILabel!
    
    @IBOutlet weak var vocabularySentences: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showChinese()
        self.navigationItem.title = vocabulary
        

        // Do any additional setup after loading the view.
    }
    func showChinese(){
        vocabularySentences.text=vocDetailTranslate
        vocabularyLabel.text=vocabularyTranslate
    }
    
    @IBAction func goToEn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
