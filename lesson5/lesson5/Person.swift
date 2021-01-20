//
//  parser.swift
//  lesson5
//
//  Created by Kirill Titov on 03.01.2021.
//

import Foundation

class Person: Codable {
    let age: Int
    let name: String
    let phone: String
    let balance: String
    
    enum CodingKey: String {
        case age = "age"
        case name = "name"
        case phone = "phone"
        case balance = "balance"
    }
    
    init(age: Int, name: String, phone: String, balance: String) {
        self.age = age
        self.name = name
        self.phone = phone
        self.balance = balance
    }
}
