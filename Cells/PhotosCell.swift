
import UIKit

class PhotosCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var albumIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlImageView: UIImageView!
    @IBOutlet weak var thumbnailUrlImageView: UIImageView!
    
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
