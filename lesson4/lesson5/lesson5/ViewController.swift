//
//  ViewController.swift
//  lesson5
//
//  Created by Kirill Titov on 03.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var persons: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.regCell()
        
        let data = readLocalFile(forName: "json")!
        
        persons = try! JSONDecoder().decode([Person].self, from: data)
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return persons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "myCell",
                                 for: indexPath) as? CollectionViewCell else {
            let cell = CollectionViewCell()
            return cell
        }

        let person = persons[indexPath.row]

        cell.setup(person: person)

        return cell
    }
    
    private func regCell() {
        let nib = UINib.init(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "myCell")
    }

}
