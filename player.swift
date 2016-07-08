//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()

    @IBAction func Play(sender: AnyObject) {
        player.play()
    }
    
    @IBAction func Pause(sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func Stop(sender: AnyObject) {
        player.pause()
        do{
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("NippuRa", ofType: "mp3")!))
        } catch {
            //error message
        }
        
    }
    
    @IBOutlet var VolumeSlider: UISlider!
    
    @IBAction func AdjustVolume(sender: AnyObject) {
        player.volume = VolumeSlider.value
    }
    
    @IBOutlet var Scrub: UISlider!
    
    
    @IBAction func ScrubSong(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(Scrub.value)
    }
    
    func UpdateScrubber()
    {
        Scrub.value = Float(player.currentTime)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
        
        try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("NippuRa", ofType: "mp3")!))
            Scrub.maximumValue = Float(player.duration)
            
            
        } catch {
            //error message
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("UpdateScrubber") , userInfo: nil, repeats: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
