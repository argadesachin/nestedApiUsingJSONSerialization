//
//  ViewController.swift
//  apiJsonParsingTask1
//
//  Created by Mac on 21/11/22.
//
  
import UIKit
import SDWebImage
class ViewController: UIViewController {

    @IBOutlet var tableViewToDisplay: UITableView!
    var jewelerys = [Jewelery]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initDataAndDelegate()
        registerNib()
        fetchingAPI()
    }
// MARK - initialization of DataSource And Delegate Method
    func initDataAndDelegate(){
        tableViewToDisplay.dataSource = self
        tableViewToDisplay.delegate = self
    }
// MARK - register tableViewCell
    func registerNib(){
        
        let nib = UINib(nibName: "APITableViewCell", bundle: nil)
        self.tableViewToDisplay.register(nib, forCellReuseIdentifier: "APITableViewCell")
    }
// MARK - fetching api data
    func fetchingAPI(){
        
        let urlString = "https://fakestoreapi.com/products/category/jewelery"
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: request){ data,response,error in
            print("Data\(data)")
            print("response\(response)")
            
            let getJsonObject = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
             
           /* var dataFromJson = NSArray()
            
            dataFromJson = getJsonObject["data"] as! NSArray
            print(dataFromJson)*/
            
            for dict in getJsonObject{
               
                let eachDict = dict as [String:Any]
                let jId = eachDict["id"] as! Int
                let jTitle = eachDict["title"] as! String
                let jPrice = eachDict["price"] as! Double
                let jDescription = eachDict["description"] as! String
                let jCategory = eachDict["category"] as! String
                let img = eachDict["image"] as! String
                let jRating = eachDict["rating"] as! [String : Any]
                
                let jrate = jRating["rate"] as! Double
                let jcount = jRating["count"] as! Double
                
                self.jewelerys.append(Jewelery(Id: jId, title: jTitle, price: jPrice, description: jDescription, category: jCategory, image1: img,rating: Rating(rate: jrate, count: jcount)))
            }
                DispatchQueue.main.async {
                self.tableViewToDisplay.reloadData()
            }
        }
        dataTask.resume()
    }
}
//MARK - Data Source method of table view
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jewelerys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewToDisplay.dequeueReusableCell(withIdentifier: "APITableViewCell", for: indexPath) as! APITableViewCell
        cell.idLabel1.text = String(jewelerys[indexPath.row].Id)
        cell.titleLabel2.text = jewelerys[indexPath.row].title
        cell.categoryLabel.text = jewelerys[indexPath.row].category
        //cell.priceLabel.text = String(jewelerys[indexPath.row].price)
        //cell.descriptionLabel.text = jewelerys[indexPath.row].description
        cell.priceLabel.text = String(jewelerys[indexPath.row].rating.rate)
        cell.descriptionLabel.text = String(jewelerys[indexPath.row].rating.count)
        
        
        let imgurl = NSURL(string: jewelerys[indexPath.row].image1)
        cell.imageView1.sd_setImage(with: imgurl as URL?)
        return cell
    }
}


extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        175
    }
}

  
