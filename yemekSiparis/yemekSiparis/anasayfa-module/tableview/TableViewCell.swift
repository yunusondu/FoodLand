//
//  TableViewCell.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var yemekImageView: UIImageView!
    @IBOutlet weak var yemekAdiLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    @IBOutlet weak var imageContainer: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }
    
    
    func resimYukle(resimAdi:String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
            DispatchQueue.main.async {
           
                self.yemekImageView.layer.cornerRadius = 40
                
                self.yemekImageView.kf.setImage(with: url)
                self.imageContainer.layer.contents = UIImage(named: "image_back")?.cgImage
                self.imageContainer.round(corners: [.topLeft, .topRight], radius: 30)
                

               
                
                
            }
        }
    }
    
          
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension UIView {
  func round(corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
  }
}

