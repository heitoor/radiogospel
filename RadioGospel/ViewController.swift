//
//  ViewController.swift
//  RadioGospel
//
//  Created by Heitor Augusto Pereira on 06/02/16.
//  Copyright © 2016 Heitor Augusto Pereira. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var playerItem: AVPlayer!
    
    @IBAction func playButton(sender: UIButton) {
        
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            let alert = UIAlertController(title: "Conexão Falhou", message: "Verifique sua conexão com a Internet.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        let url = "http://m1.fabricahost.com.br:8706/;stream.mp3"
        playerItem = AVPlayer(URL:NSURL(string:url)!)
        playerItem.play()
        print("Tocando")
    }
    
    @IBAction func stopButton(sender: UIButton) {
        playerItem.pause()
    }
    

}