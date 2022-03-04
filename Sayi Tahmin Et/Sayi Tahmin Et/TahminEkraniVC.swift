//
//  TahminEkraniVC.swift
//  Sayi Tahmin Et
//
//  Created by Pınar Macit on 2.03.2022.
//

import UIKit

class TahminEkraniVC: UIViewController {

    @IBOutlet weak var labelKalanHak: UILabel!
    @IBOutlet weak var labelYardim: UILabel!
    
    @IBOutlet weak var textfieldGirdi: UITextField!
    
    var rasgeleSayi:Int?
    var kalanHak = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rasgeleSayi = Int.random(in: 0...100) // 0-100 arasında sayı
        print("Rasgele Sayı : \(rasgeleSayi!)")
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //geçiş dinleme işlemi
        
        if let gelenVeri = sender as? Bool {
            
            let gidilecekVC = segue.destination as! SonucEkraniVC
                 
            gidilecekVC.sonuc = gelenVeri
        }
    }
    @IBAction func tahminet(_ sender: Any) {
        
        labelYardim.isHidden = false
        kalanHak-=1
        if let veri = textfieldGirdi.text { // önce veriyi aldık daha sonra dönüşüm yaptık.
            if let tahmin = Int(veri){
                
                if kalanHak != 0 {
                    
                    if tahmin == rasgeleSayi! {
                     let sonuc = true
                        performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                        return
                    }
                    
                    if tahmin > rasgeleSayi! {
                        labelYardim.text = "Azalt"
                        labelKalanHak.text = "Kalan Hak : \(kalanHak)"
                    }
                    
                    if tahmin < rasgeleSayi! {
                        labelYardim.text = "Arttır"
                        labelKalanHak.text = "Kalan Hak : \(kalanHak)"
                    }
                    if(kalanHak == 0){ // tahmin hakkı kalmaz ise
                        let sonuc = false
                           performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                    }
                
                textfieldGirdi.text = ""
            }
        }
    }
    
}
}
