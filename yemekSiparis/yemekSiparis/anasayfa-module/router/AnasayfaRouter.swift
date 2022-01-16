//
//  AnasayfaRouter.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//


import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        
        ref.anasayfaPresenterNesnesi = presenter
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref        
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
}

