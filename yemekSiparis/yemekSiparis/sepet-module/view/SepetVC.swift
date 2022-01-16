//
//  SepetVC.swift
//  yemekSiparis
//
//  Created by Macbook Air on 10.01.2022.
//

import UIKit


class SepetVC: UIViewController {
    
    @IBOutlet weak var sepetTutarLabel: UILabel!
    @IBOutlet weak var cardTabItem: UITabBarItem!
    @IBOutlet weak var sepetViewContainer: UIView!
    
    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    var sepetListe = [SepetYemekler]()

    @IBOutlet weak var sepetTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sepetViewContainer.layer.contents = UIImage(named: "bg5")?.cgImage
        
        sepetTableView.backgroundColor = UIColor.clear

        sepetTableView.delegate = self
        sepetTableView.dataSource = self
    
        SepetRouter.createModule(ref: self)

    }
    override func viewWillAppear(_ animated: Bool) {
        sepetTableView.backgroundColor = UIColor.clear

        sepetPresenterNesnesi?.tumYemekleriAl()
            toplam()
    }
    func toplam(){
            var totalcost = 0
            var cost = 0
            for yemek in sepetListe{
                cost = Int(yemek.yemek_fiyat!)! * Int(yemek.yemek_siparis_adet!)!
                totalcost += cost
            }
            self.sepetTutarLabel.text = " $\(String(totalcost)) "
        }
}

extension SepetVC : PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetListesi: Array<SepetYemekler>) {
        self.sepetListe = sepetListesi
        
        
        cardTabItem.badgeValue = "\(sepetListe.count)"
        
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
            self.toplam()
        }
    }
}


extension SepetVC : UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return sepetListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = sepetListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetCell",for: indexPath) as! SepetTableViewCell
        hucre.sepetYemekAdiLabel.text = "\(yemek.yemek_adi!)"
        hucre.sepetYemekFiyatLabel.text = "$ \(yemek.yemek_fiyat!)"
        hucre.sepetYemekAdetLabel.text = "Qty : \(yemek.yemek_siparis_adet!)"
        hucre.layer.shadowRadius = 4
        hucre.layer.cornerRadius = 10
        
        hucre.resimGoster(resimAdi: "\(yemek.yemek_resim_adi!)")
        
        hucre.contentView.backgroundColor = UIColor.clear

        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Delete"){ (contextualAction,view,bool) in
            let yemek = self.sepetListe[indexPath.row]
            self.sepetPresenterNesnesi?.yemekSil(sepet_yemek_id: Int(yemek.sepet_yemek_id!)!, kullanici_adi: "yunus_ondu")
           
            }
        
        return UISwipeActionsConfiguration(actions: [silAction])
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
}
