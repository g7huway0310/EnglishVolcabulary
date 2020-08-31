//
//  ViewController.swift
//  a-z
//
//  Created by guowei on 2020/8/30.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func alphbatTap(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showDeatil", sender:sender.currentTitle)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller=segue.destination as! EnglishViewController
        let chooseAlphabet=sender as! String
        controller.alphalbet=chooseAlphabet
        
    
    }
}

