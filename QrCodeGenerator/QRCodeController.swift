//
//  QRCodeController.swift
//  QrCodeGenerator
//
//  Created by Jhonatan Silva de Sousa on 25/03/18.
//  Copyright © 2018 Jhonatan Silva de Sousa. All rights reserved.
//

import UIKit

class QRCodeController: UIViewController {

    @IBOutlet weak var qrcode: UIImageView!
    @IBOutlet weak var txt_qrcode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var bn_generate: UIButton!
    


    @IBAction func click(_ sender: Any) {
        var n = txt_qrcode.text;
        
        if(n != nil){
            n = n?.replacingOccurrences(of: " ", with: "+");
            loadImage(imageURL: "https://chart.googleapis.com/chart?chs=320x320&cht=qr&chl="+n!+"");
        }
    
    }
    
    
    func loadImage(imageURL : String)
    {
        let myUrl = URL(string : imageURL);
        let url = URLRequest(url : myUrl!);
        let session  = URLSession.shared;
        
        let task = session.dataTask(with: url) {
            (data, responde, error) in
            if let imageData = data {
                DispatchQueue.main.async {
                    self.qrcode.image = UIImage(data : imageData);
                }
            }
        }
        
        task.resume();
    }

}
