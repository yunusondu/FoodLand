//
//  AnasayfaInteractor.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//

import Foundation
import Alamofire

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?

    func tumYemekleriAl() {
     
            AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
                if let data = response.data {
                    do{
                        let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                        var liste = [Yemekler]()
                        if let gelenListe = cevap.yemekler {
                            liste = gelenListe;
                        }
                        self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
        
    
    
        
    
