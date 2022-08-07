//
//  Video.swift
//  M5-WrapupChallenge-VideoList
//
//  Created by Ian Howard on 8/7/22.
//

import Foundation

struct Video : Identifiable, Decodable {
    var id:Int
    var title:String
    var url:String
}
