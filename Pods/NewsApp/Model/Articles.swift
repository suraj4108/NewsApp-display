//
//  Articles.swift
//  NewsApp
//
//  Created by Suraj Singh on 03/08/22.
//

import Foundation

struct Articles: Codable{
    let author: String?
    let title: String
    let urlToImage:String?
    let content: String
}
