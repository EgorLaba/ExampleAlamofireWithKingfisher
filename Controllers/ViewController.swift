
import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    var photos: [Photo] = []
    @IBOutlet weak var tableView: UITableView!
    
    
   
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        AF.request("https://jsonplaceholder.typicode.com/photos").responseJSON { (response) in
            guard let value = response.value as? [[String: Any]] else {
                return
            }
            value.forEach { photoDict in
                let photo = Photo()
                photo.albumId = photoDict["albumId"] as? Int
                photo.id = photoDict["id"] as? Int
                photo.title = photoDict["title"] as? String
                photo.url = photoDict["url"] as? String
                photo.thumbnailUrl = photoDict["thumbnailUrl"] as? String
                self.photos.append(photo)
            }
            self.tableView.reloadData()
        }
    }
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell", for: indexPath) as! PhotosCell
        let photo = photos[indexPath.row]
        if let albumId = photo.albumId, let id = photo.id, let title = photo.title {
            cell.albumIdLabel.text = "AlbumId: \(String(albumId))"
            cell.idLabel.text = "Id: \(String(id))"
            cell.titleLabel.text = "Title: \(title)"
        }
        
        if let photoURL = photo.url, let url = URL(string: photoURL ) {
            cell.urlImageView.kf.setImage(with: url)
        }
        if let photoThumbnailUrl = photo.thumbnailUrl, let url = URL(string: photoThumbnailUrl) {
            cell.thumbnailUrlImageView.kf.setImage(with: url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}

