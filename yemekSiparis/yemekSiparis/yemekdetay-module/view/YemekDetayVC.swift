//
//  YemekDetayVC.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//

import UIKit
import Kingfisher

class YemekDetayVC: UIViewController {
    @IBOutlet weak var yemekDetayCardView: UIView!
    @IBOutlet weak var yemekDetayImage: UIImageView!
    @IBOutlet weak var yemekDetayAd: UILabel!
    @IBOutlet weak var yemekDetayFiyat: UILabel!
    @IBOutlet weak var yemekDetayAdet: UILabel!
    @IBOutlet weak var stepperButtonView: UIStepper!
    
    var yemek:Yemekler?
    var yemekDetayPresenterNesnesi:ViewToPresenterYemekDetayProtocol?

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        viewBlur()
        if let y = yemek {
            yemekDetayAd.text = y.yemek_adi
            yemekDetayFiyat.text = y.yemek_fiyat
            yemekDetayImage.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)"))
        }
        yemekDetayCardView.layer.contents = UIImage(named: "image_back2")?.cgImage
        yemekDetayCardView.round(corners: [.topLeft, .topRight,.bottomLeft,.bottomRight], radius: 30)
        yemekDetayCardView.layer.cornerRadius = 10
        yemekDetayCardView.layer.shadowRadius = 10.0
        stepperButtonView.layer.cornerRadius = 10;
        
        YemekDetayRouter.createModule(ref: self)
    }
    
    @IBAction func stepperButton(_ sender: UIStepper) {
        yemekDetayAdet.text = "\(Int(sender.value))"
    }
    
    
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        yemekDetayPresenterNesnesi?.Ekle(yemek_adi: yemekDetayAd.text!, yemek_resim_adi: (yemek?.yemek_resim_adi)!, yemek_fiyat: Int(yemekDetayFiyat.text!)!, yemek_siparis_adet: Int(yemekDetayAdet.text!)!, kullanici_adi: "yunus_ondu")
        self.dismiss(animated: true, completion: nil)
    }
}


extension YemekDetayVC  {
    
    func viewBlur(){
        view.backgroundColor  = .clear
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
          blurView.topAnchor.constraint(equalTo: view.topAnchor),
          blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
          blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
}


