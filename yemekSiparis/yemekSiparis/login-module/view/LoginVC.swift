//
//  LoginVC.swift
//  yemekSiparis
//
//  Created by Macbook Air on 15.01.2022.
//

import UIKit




class LoginVC: UIViewController {
    @IBOutlet weak var kullaniciAdiTextField: UITextField!
    @IBOutlet weak var loginViewContainer: UIView!
    @IBOutlet weak var kullaniciSifreTextField: UITextField!
    
    var loginPresenterNesnesi:ViewToPresenterLoginProtocol?
    
    var kullaniciListe = [LoginModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loginPresenterNesnesi?.kisileriYukle()

        loginViewContainer.layer.contents = UIImage(named: "bg2")?.cgImage

        LoginRouter.createModule(ref: self)
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loginPresenterNesnesi?.kisileriYukle()
        
        
    }
    

    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        for kullanici in kullaniciListe {
            
            if kullanici.kullanici_adi == kullaniciAdiTextField.text && kullanici.kullanici_sifre == kullaniciSifreTextField.text  {
                
                performSegue(withIdentifier: "toHome", sender: kullaniciAdiTextField.text)
               
            }else {
               
            }
        }
    }
    
}
extension LoginVC : PresenterToViewLoginProtocol {
    func vieweVeriGonder(kullaniciListesi: Array<LoginModel>) {
        self.kullaniciListe = kullaniciListesi
        
        }
}
                

