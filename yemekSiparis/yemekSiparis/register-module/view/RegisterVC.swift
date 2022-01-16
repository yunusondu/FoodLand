//
//  RegisterVC.swift
//  yemekSiparis
//
//  Created by Macbook Air on 15.01.2022.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate


class RegisterVC: UIViewController {
    @IBOutlet weak var registerViewContainer: UIView!
    
    @IBOutlet weak var kullaniciAdiTextField: UITextField!
    
    @IBOutlet weak var kullaniciSifreTextField: UITextField!
    var registerPresenterNesnesi: ViewToPresenterRegisterProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        registerViewContainer.layer.contents = UIImage(named: "bg3")?.cgImage

        
        registerViewContainer.round(corners: [.topLeft, .topRight,.bottomLeft,.bottomRight], radius: 30)
        
        registerViewContainer.layer.shadowColor = UIColor.black.cgColor
        registerViewContainer.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        registerViewContainer.layer.shadowOpacity = 1
        registerViewContainer.layer.shadowRadius = 4.0
        

        
        
        RegisterRouter.createModule(ref: self)
        
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = kullaniciAdiTextField.text,let ks = kullaniciSifreTextField.text {
            registerPresenterNesnesi?.ekle(kullanici_adi: ka, kullanici_sifre: ks)
            
            self.dismiss(animated: true, completion: nil)

        }
    }
    
}

extension RegisterVC  {
    
    func viewBlur(){
        registerViewContainer.backgroundColor  = .clear
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

