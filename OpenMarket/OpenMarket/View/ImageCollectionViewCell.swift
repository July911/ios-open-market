import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        layoutImageView()
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    func updateImage(to newImage: UIImage) {
        self.imageView.image = newImage
        print("이미지 업데이트")
    }
    
    func layoutImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = self.bounds
    }
}