//
//  ViewController.swift
//  WebAPISample
//
//  Created by Shinya Yamamoto on 2016/06/19.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {

    @IBOutlet weak var itemSearchBar: UISearchBar!
    @IBOutlet weak var itemTableView: UITableView!
    
    @IBOutlet weak var rankingTableView: UITableView!
    
    var itemsArray  = [items]()
    var itemPageURL:String = ""
    
    let appid:String = "dj0zaiZpPW9BTUhQS3d4VFo3ZiZzPWNvbnN1bWVyc2VjcmV0Jng9ZjI-"
    let entryURL:String = "http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemSearch"
    var searchWord:String = "iphone"
    
    var loadview = myLoadView()
    var shopRank = [String:Int]()
    var shops = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadItemData()
        
        self.itemTableView.delegate = self
        self.itemTableView.dataSource = self
        self.itemSearchBar.delegate = self
        self.rankingTableView.delegate = self
        self.rankingTableView.dataSource = self
        
        self.createLoadView()
        self.analyseShopRaking()
    }
    
    
    func analyseShopRaking() {
        
        shops.removeAll()
        shopRank.removeAll()
        
        //shopRankのpointを計算する
        for item in itemsArray {
            
            if let shopName = item.itemShop {
                
                let point = shopRank["\(shopName)"]
                
                //すでに存在するとき
                if let point = point {
                    let newPoint = point + 1
                    shopRank["\(shopName)"] = newPoint
                } else {
                    //はじめて出現した
                    shopRank["\(shopName)"] = 1
                }
            }
            
        }
        
        
        //shopの名前を配列に格納する
        shops = Array(shopRank.keys).sort({shopRank[$0] > shopRank[$1]})
        
        //メインキューでUIの処理をする。
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.rankingTableView.reloadData()
        })
        
    }
    
    func createLoadView() -> Void {
        let bundle = NSBundle(forClass: myLoadView.self)
        self.loadview = bundle.loadNibNamed("myLoadView", owner: nil, options: nil)[0] as! myLoadView
        self.loadview.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.view.addSubview(self.loadview)
        loadview.hidden = true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createRequestURL()-> String {
    
        return (entryURL+"?appid="+appid+"&query="+searchWord)
    }

    func loadItemData() {
        
        let loadURL:String = self.createRequestURL()
        let json = JSON(url:loadURL)
        let jsonData = json["ResultSet"]["0"]["Result"]
        
        if jsonData.count < 1 {
            self.alertErrorConnection()
            return
        }
        
        itemsArray.removeAll()
        for (_, data) in jsonData {
            //print(data)
            let itemNameJson = data["Name"]
            let itemPriceJson = data["PriceLabel"]["DefaultPrice"]
            let itemImageJson = data["Image"]["Medium"]
            let itemURLJson = data["Url"]
            let itemShopJson = data["Store"]["Name"]
            
            
            let item = items()
            guard let itemName = itemNameJson.asString else { continue }
            guard let itemPrice = itemPriceJson.asString else { continue }
            guard let itemImageUrl = itemImageJson.asString else { continue }
            guard let itemUrl = itemURLJson.asString else { continue }
            guard let itemShop = itemShopJson.asString else { continue }
            
            item.itemName = itemName
            item.itemPrice = "¥" + itemPrice
            item.itemImageUrl = itemImageUrl
            item.itemUrl  = itemUrl
            item.itemShop = itemShop
            
            itemsArray.append(item)
            
        }
        
        //UIの処理
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.itemTableView.reloadData()
            self.loadview.hidden = true
            self.loadview.loadingIndicator.stopAnimating()
        })
        
        
        
    }
    
    func alertErrorConnection() {
        
        let alertController:UIAlertController = UIAlertController(title:"通信エラー",
                                                                  message: "通信エラーです",
                                                                  preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .Cancel) { (action:UIAlertAction!) in
            
        }
        
        
        let OKAction = UIAlertAction(title: "通信する", style: .Default) { (action:UIAlertAction!) in
            self.loadItemData()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true, completion:nil)
    }
    
    
    //MARK:サーチバーデリゲート
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        let encodedString = searchText.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        self.searchWord = encodedString!

    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            searchBar.resignFirstResponder()
            self.loadview.hidden = false
            self.loadview.loadingIndicator.startAnimating()
        })
        
        let queue:dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) {() -> Void in
            
            self.loadItemData()
            self.analyseShopRaking()
        }
        
        
    }
   
    
    
    //MARK:テーブルビューデリゲートメソッド
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
            case itemTableView:
                return itemsArray.count
            case rankingTableView:
                return shopRank.count
            default:
                print("error")
                return 0
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch tableView {
            case itemTableView:
                let cell = NSBundle.mainBundle().loadNibNamed("itemCell", owner: self, options: nil).first as! itemCell
                
                cell.itemName.text = "\(itemsArray[indexPath.row].itemName!)"
                //cell.itemPrice.text = "\(itemsArray[indexPath.row].itemPrice!)"
                cell.itemShop.text = "\(itemsArray[indexPath.row].itemShop!)"
                cell.setItemImageWith("\(itemsArray[indexPath.row].itemImageUrl!)")
                return cell
            case rankingTableView:
                let cell = NSBundle.mainBundle().loadNibNamed("rankCell", owner: self, options: nil).first as! rankCell
                let shopName = shops[indexPath.row];
                let point = shopRank[shopName]
                cell.setRankCell(shopName:shopName, shopPoint: "\(point!)")
                
                if shopName.rangeOfString("RODEO") != nil{
                    
                    cell.backgroundColor = UIColor.init(red: 141/255, green: 215/255, blue: 252/255, alpha: 1)
                }
                
                
                return cell
                
            default:
                print("error")
                let cell = UITableViewCell()
                return cell
            
        }
        
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        switch tableView {
        case itemTableView:
            self.itemPageURL = itemsArray[indexPath.row].itemUrl!
            performSegueWithIdentifier("PushShopDetail", sender: nil)
            break
        default:
            print("this is not itemTableView")
        }
        
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let viewController = segue.destinationViewController as! itemDetailViewController
        viewController.itemPageURL = self.itemPageURL
        
        
    }
    


}

