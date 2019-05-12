//
//  HistoryViewController.swift
//  MusicApp
//
//  Created by 助永悠輝 on 2019/05/13.
//  Copyright © 2019 助永悠輝. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var historyList: Results<HistoryModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Realmからデータを取得
        do{
            let dao = Dao.dao
            historyList = dao.findAll()
        }catch{
            print("realm load error")
        }
        if(historyList.count == 0) {
        }
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = historyList[indexPath.row].word
        return cell
    }
    
    var history: HistoryModel!
    //    ここから
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        history = historyList[indexPath.row]
        
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "next") {
            let secondVC: HistoryDetailViewController = (segue.destination as? HistoryDetailViewController)!
            secondVC.history = history
        }
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
