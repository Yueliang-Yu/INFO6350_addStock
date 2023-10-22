//
//  AddStockViewController.swift
//  Stock_App
//
//  Created by 余玥良 on 2023/10/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddStockViewController: UIViewController {

    @IBOutlet weak var txtStock: UITextField!
    
    @IBAction func addStockAction(_ sender: Any) {
        guard let stockSymbol = txtStock.text else {return}

        let url = "\(baseURL)profile/\(stockSymbol)?apikey=\(apiKey)"

        AF.request(url).responseJSON { response in

            if(response.error != nil){

                print(response.error?.localizedDescription)

                return

            }

            // We have valid data here

            guard let rawData = response.data else {return}

            guard let jsonArray = JSON(rawData).array else {return}

            guard let stock = jsonArray.first else {return}

            

            let symbol = stock["symbol"].stringValue

            let price = stock["price"].floatValue

            let companyName = stock["companyName"].stringValue

            let description = stock["description"].stringValue

            

            print(symbol)

            print(price)

            print(companyName)

            print(description)

            //            let stockClass = StockClass()

            //            stockClass.symbol = symbol

            //            stockClass.price = price

            //            stockClass.companyName = companyName

            //            stockClass.desc = description

            //            self.addStockToDB(stockClass)

            

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
