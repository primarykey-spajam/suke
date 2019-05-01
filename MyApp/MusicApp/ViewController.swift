
import UIKit
import AVKit
import AVFoundation
import SafariServices

class ViewController: UIViewController {
    

    @IBAction func playVideo(_ sender: UIButton) {
        guard let url = URL(string: "https://www.youtube.com/?gl=JP&hl=ja") else {
            return
        }
        let safariViewControllerObject = SFSafariViewController(url: url)
        self.present(safariViewControllerObject, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

