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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func click(_ sender: Any) {
        get_image(url_str : "https://chart.googleapis.com/chart?chs=50x50&cht=qr&chl=Hello+world&chld=L|1&choe=UTF-8", qrcode);
    }
    
    
    func get_image(url_str:String, _ imageView:UIImageView)
    {
        
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            
            if data != nil
            {
                let image = UIImage(data: data!)
                
                if(image != nil)
                {
                    
                    DispatchQueue.main.async(execute: {
                        
                        imageView.image = image
                        imageView.alpha = 0
                        
                        UIView.animate(withDuration: 2.5, animations: {
                            imageView.alpha = 1.0
                        })
                        
                    })
                    
                }
                
            }
            
            
        })
        
        task.resume()
    }

}
