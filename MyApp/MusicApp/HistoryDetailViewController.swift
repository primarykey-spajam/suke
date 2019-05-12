//
//  HistoryDetailViewController.swift
//  MusicApp
//
//  Created by 助永悠輝 on 2019/05/13.
//  Copyright © 2019 助永悠輝. All rights reserved.
//

import UIKit

class HistoryDetailViewController: UIViewController {

    @IBOutlet weak var historyWord: UILabel!
    @IBOutlet weak var historyContents: UITextView!
    var history: HistoryModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        historyWord.text = history.word
        historyContents.text = history.contents
        // Do any additional setup after loading the view.
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
