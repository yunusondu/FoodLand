//
//  YemekDetayPresenter.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//

import Foundation

class YemekDetayPresenter : ViewToPresenterYemekDetayProtocol {
    func Ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        yemekDetayInteractor?.sepeteEkle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)

    }
    
    var yemekDetayInteractor: PresenterToInteractorYemekDetayProtocol?
}

