//
//  ViewController.swift
//  Stock_App
//
//  Created by 余玥良 on 2023/10/21.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITableViewDataSource {

    let stockNames = ["MSFT", "TSLA", "META", "GOOG"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = stockNames[indexPath.row]
        
        return cell
    }
}

