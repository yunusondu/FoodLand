//
//  SepetInteractor.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//
import Foundation
import Alamofire
import Kingfisher

class SepetInteractor :PresenterToInteractorSepetProtocol {

    var sepetPresenter: InteractorToPresenterSepetProtocol?

    func yemekleriYukle() {
        let params:Parameters = ["kullanici_adi":"yunus_ondu"]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).responseJSON{  response in
            if let mydata = response.data {
                do {
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: mydata)
                    
                    var liste = [SepetYemekler]()
                    if let gelenListe = cevap.sepet_yemekler{
                        liste = gelenListe
                        print(liste)
                    }
                    self.sepetPresenter?.presenteraVeriGonder(sepetListesi: liste)
                }catch {
                    self.sepetPresenter?.presenteraVeriGonder(sepetListesi: [])
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func `sil`(sepet_yemek_id: Int, kullanici_adi: String) {
        let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":"yunus_ondu"]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).responseJSON{  response in
            if let data = response.data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        self.yemekleriYukle()
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
    }
    }
    
   
    }
    
    
   
