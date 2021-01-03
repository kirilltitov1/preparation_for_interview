//
//  CollectionViewCell.swift
//  lesson5
//
//  Created by Kirill Titov on 03.01.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var balance: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(person: Person) {
        name.text = person.name
        age.text = String(person.age)
        balance.text = person.balance
    }
    
}
