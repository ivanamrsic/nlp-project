//
//  SearchResultTableViewCell.swift
//  SentimentClassifier
//
//  Created by Ivana Mršić on 26.12.2020..
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SearchResultTableViewCell {

    func configure(with item: SearchResultCellItem) {
        
    }
}
