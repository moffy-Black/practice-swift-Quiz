//
//  ViewController.swift
//  Quiz
//
//  Created by Koki Kurokawa on 2021/06/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.label.text = "Hello"
    }

    @IBAction func pressButton(_ sender: Any) {
        self.label.text = "ボタンを押しました"
    }
    
}

