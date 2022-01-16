//
//  AnasayfaVC.swift
//  yemekSiparis
//
//  Created by Macbook Air on 9.01.2022.
//

import UIKit
import Kingfisher


class AnasayfaVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yemeklerTableView: UITableView!
    
    @IBOutlet weak var anasayfaContainer: UIView!
    var yemeklerListe = [Yemekler]()
    var arananYemekListe = [Yemekler]()
    
    
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yemeklerTableView.backgroundColor = UIColor.clear

        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        searchBar.delegate = self
        anasayfaContainer.layer.contents = UIImage(named: "bg5")?.cgImage
        searchBar.round(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 20)

        AnasayfaRouter.createModule(ref: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        yemeklerTableView.backgroundColor = UIColor.clear

        anasayfaPresenterNesnesi?.yemekleriAl()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
           
            let yemek = sender as? Yemekler
            let gidilecekVC = segue.destination as! YemekDetayVC
            gidilecekVC.yemek = yemek
            if let presentationController = gidilecekVC.presentationController as? UISheetPresentationController {
                presentationController.detents = [.medium()]
            }
        }
    }
}


extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        self.arananYemekListe = yemeklerListe
        DispatchQueue.main.async {
            self.yemeklerTableView.reloadData()
        }
    }
}
extension AnasayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.arananYemekListe = self.yemeklerListe.filter{yemek in
            if yemek.yemek_adi!.lowercased().contains(searchText.lowercased()){
                return true
            }
            if searchText == ""{
                return true
            }
            return false
        }
        self.yemeklerTableView.reloadData()
    }
}

extension AnasayfaVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arananYemekListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = arananYemekListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yemeklerHucre",for: indexPath) as! TableViewCell
        
        hucre.contentView.backgroundColor = UIColor.clear

        hucre.yemekAdiLabel.text = "\(yemek.yemek_adi!)"
        hucre.yemekFiyatLabel.text = "$ \(yemek.yemek_fiyat!) "
        hucre.resimYukle(resimAdi: "\(yemek.yemek_resim_adi!)")
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = arananYemekListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


