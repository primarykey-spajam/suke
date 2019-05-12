//
//  WikiViewController.swift
//  MusicApp
//
//  Created by 助永悠輝 on 2019/05/01.
//  Copyright © 2019 助永悠輝. All rights reserved.
//
import UIKit
//TODO: 履歴機能追加
//TODO: api呼び出し周り

class WikiViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var wikiView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mySearchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        wikiView.text = getWikiDigest(word: searchBar.text)
        searchBar.text = ""
        self.view.endEditing(true)
    }
    
    struct JsonSample: Codable {
        var title: String
        var body: String
    }
    //ひとまずbodyを返す仕様
    private func getWikiDigest(word: String?) -> String? {
        //wiki api
        //強制アンラップはあんまよくない
        let dao = Dao.dao
        var url = "http://wikipedia.simpleapi.net/api?keyword=" + word! + "&output=json"
        url = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let urlOpt = URL(string: url)
        
        let request = URLRequest(url: urlOpt!)
        let task = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            guard let data = data else { return }
            let json = try? JSONDecoder().decode([JsonSample].self, from: data)
            // サブスレッドからViewの値は帰れないらしいからメインスレッドに戻した
            if let resBody = json?[0].body {
                DispatchQueue.main.async{
                    let historyModel = HistoryModel()
                    historyModel.word = word!
                    historyModel.contents = resBody
                    dao.create(d: historyModel)
                    self.wikiView.text = resBody
                }
            } else {
                DispatchQueue.main.async{self.wikiView.text = "検索結果が見当たりませんでした"}
            }
        }
        // リクエストを実行
        task.resume()
        return "データ取得中"
    }
}
