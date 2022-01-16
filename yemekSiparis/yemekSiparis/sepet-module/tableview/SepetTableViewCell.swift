//
//  SepetTableViewCell.swift
//  yemekSiparis
//
//  Created by Macbook Air on 12.01.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

    @IBOutlet weak var sepetImageView: UIImageView!
    @IBOutlet weak var sepetYemekAdiLabel: UILabel!
    
    @IBOutlet weak var sepetYemekFiyatLabel: UILabel!
  
    @IBOutlet weak var sepetYemekAdetLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func resimGoster(resimAdi:String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
            DispatchQueue.main.async {
                self.sepetImageView.kf.setImage(with: url)
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
