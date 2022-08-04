//
//  NewsDescriptionViewController.swift
//  NewsApp
//
//  Created by Suraj Singh on 03/08/22.
//

import UIKit

class NewsDescriptionViewController: UIViewController {

    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var descriptionOutlet: UILabel!
    var newsContent: Articles = Articles(author: "", title: "", urlToImage: "", content: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleOutlet.text = newsContent.title
        if newsContent.urlToImage != nil {
            imageOutlet.sd_setImage(with: URL(string: newsContent.urlToImage!), completed: nil)
            imageOutlet.contentMode = .scaleToFill

        }
        else{
            imageOutlet.image = UIImage(named: "image1")
        }
        descriptionOutlet.text = newsContent.content
    }
    


}
