//
//  SepetPresenter.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {

    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?
    func tumYemekleriAl() {
        sepetInteractor?.yemekleriYukle()

    }
    
    func yemekSil(sepet_yemek_id: Int, kullanici_adi: String) {
        sepetInteractor?.sil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
   
   
}

extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetListesi: Array<SepetYemekler>) {
        sepetView?.vieweVeriGonder(sepetListesi: sepetListesi)
    }
}
