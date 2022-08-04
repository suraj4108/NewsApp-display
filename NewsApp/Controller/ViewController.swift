//
//  ViewController.swift
//  NewsApp
//
//  Created by Suraj Singh on 03/08/22.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    var article = [Articles]()
    
    let refreshControl = UIRefreshControl()


    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        
        fetchData()
        
        tableViewOutlet.reloadData()
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableViewOutlet.addSubview(refreshControl)
    }
    
    @objc func refreshData(){
        refreshControl.endRefreshing()
        tableViewOutlet.reloadData()
    }

    func fetchData() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=dd17c2e510a54318b484c140b591b306")
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if error != nil{
                print(error)
                return
            }
            
            if let safeData = data{
                var newsData: NewsFetchData?
                do{
                    newsData = try JSONDecoder().decode(NewsFetchData.self, from: safeData)
                }
                catch{
                    print("Error while decoding JSON data")
                }
                self.article = newsData!.articles
                
                DispatchQueue.main.async {
                    self.tableViewOutlet.reloadData()
                }
            }
        }
        dataTask.resume()
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomTableViewCell
        
        if article[indexPath.row].author != nil{
            cell.authorOutlet.text = "Author: \(article[indexPath.row].author!)"
        } else {
            cell.authorOutlet.text = "No Author Data"
        }
        
        cell.titleOutlet.text = article[indexPath.row].title
        
        if article[indexPath.row].urlToImage != nil{
            cell.imageOutlet.sd_setImage(with: URL(string: article[indexPath.row].urlToImage!), completed: nil)
            cell.imageOutlet.contentMode = .scaleToFill
        } else {
            cell.imageOutlet.image = UIImage(named: "image1")
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "descriptionVC") as? NewsDescriptionViewController
        vc?.newsContent = article[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    
    }
}
