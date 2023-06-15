//
//  CharacterDetailsViewController.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    @IBOutlet var charImageView: UIImageView!
    @IBOutlet var charTitleLabel: UILabel!
    @IBOutlet var charDetailLabel: UILabel!
    
    var charDetails: CharInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let charDetails = charDetails else { return }
        setupDetailsUI(details: charDetails)
    }
    
    func setupDetailsUI(details: CharInfo) {
        self.charTitleLabel.text = details.title
        self.charDetailLabel.text = details.description
        if let imageURL = details.imageURL {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        self.charImageView.image = UIImage(data: data)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.charImageView.image = UIImage(systemName: "questionmark.circle.fill")
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.charImageView.image = UIImage(systemName: "questionmark.circle.fill")
            }
        }
    }
}


