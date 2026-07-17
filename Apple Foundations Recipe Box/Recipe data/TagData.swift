//
//  TagData.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 17/7/2026.
//

import Foundation

@Observable
class TagData {
    var Tags = [
        Tag(name: "Vegan"),
        Tag(name: "Vegetarian"),
        Tag(name: "Celiac"),
        Tag(name: "Halal"),
        Tag(name: "Keto"),
        Tag(name: "Paleo"),
        Tag(name: "Mediterranean"),
        Tag(name: "High Protein")
    ]
}

var myTagData = TagData()



