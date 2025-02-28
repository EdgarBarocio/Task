//
//  SearchResultCell.swift
//  GifSearcher
//
//  Created  on 6/5/20.
//

import UIKit
import FLAnimatedImage

class SearchResultCell: UICollectionViewCell {
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var imageView: FLAnimatedImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        update(with: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        update(with: nil)
    }
    
    func update(with url: String?) {
        if let urlOfGif = url {
            
            let url = URL(string: urlOfGif)!
            let imageData = try? Data(contentsOf: url)
            let animatedGif = FLAnimatedImage(animatedGIFData: imageData)
            imageView.animatedImage = animatedGif
            spinner.stopAnimating()
        } else {
            spinner.startAnimating()
        }
    }
}
