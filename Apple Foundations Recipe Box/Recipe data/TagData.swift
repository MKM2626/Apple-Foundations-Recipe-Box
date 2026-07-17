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
        Tag(name: "Vegeterian")

    ]
}

var myTagData = TagData()
