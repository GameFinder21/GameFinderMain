//
//  GameData.swift
//  GameDiscover
//
//  Created by Jiayi on 4/12/22.
//

import Foundation

struct GameData : Decodable{
    let name : String
    let description_raw : String
    let background_image : String
    let background_image_additional : String
}
