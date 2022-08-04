//
//  NewsFetchData.swift
//  NewsApp
//
//  Created by Suraj Singh on 03/08/22.
//

import Foundation

struct NewsFetchData: Codable{
    let status: String
    let articles:[Articles]
}
