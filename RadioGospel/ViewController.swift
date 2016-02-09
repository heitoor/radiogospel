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
    
    private let url = "http://m1.fabricahost.com.br:8706/;stream.mp3"
    var player: AVPlayer!
    var toggleState = 1
    
    @IBAction func playButton(sender: UIButton) {
        let playB = sender as UIButton
        
        testConnection()
        playBackground()
        
        if toggleState == 1 {
            player = AVPlayer(URL:NSURL(string:url)!)
            player.play()
            toggleState = 2
            playB.setImage(UIImage(named: "pauseIMG.jpeg"), forState: UIControlState.Normal)
        } else {
            player.pause()
            toggleState = 1
            playB.setImage(UIImage(named: "playIMG.jpg"), forState: UIControlState.Normal)
        }
        
        
    }
    
 
    func testConnection() {
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            let alert = UIAlertController(title: "Conexão Falhou", message: "Verifique sua conexão com a Internet.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func playBackground() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            print("AVAudioSession Category Playback OK")
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                print("AVAudioSession is Active")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
}
    

