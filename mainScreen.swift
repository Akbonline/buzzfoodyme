//
//  mainScreen.swift
//  buzzFood
//
//  Created by Akshat Bajpai on 11/21/20.
//

import UIKit
import AVFoundation

class mainScreen: UIViewController {
    var player: AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundVideo()
        // Do any additional setup after loading the view.
    }
    func playBackgroundVideo(){
        let path = Bundle.main.path(forResource: "food", ofType: ".mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        self.player?.isMuted = true
    }
    @objc func playerItemDidReachEnd(){
        player!.seek(to:CMTime.zero)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
