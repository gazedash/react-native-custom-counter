import Foundation
import MediaPlayer

@objc(CounterViewManager)
class CounterViewManager: RCTViewManager {
  override func view() -> UIView! {
    return CounterView()
  }
  
  @objc func updateFromManager(_ node: NSNumber, count: NSNumber) {
    // let rect = CGRect(x: -100, y: 0, width: 0, height: 0)
    // let rect = CGRect(x: 0, y: 0, width: 100, height: 100) 
    // let airplayVolume = MPVolumeView(frame: rect)
    // airplayVolume.showsVolumeSlider = true
    // airplayVolume.showsRouteButton = true
    // self.view().addSubview(airplayVolume)
    // for view: UIView in airplayVolume.subviews {
    //     if let button = view as? UIButton {
    //         button.sendActions(for: .touchUpInside)
    //         break
    //     }
    // }

    DispatchQueue.main.async {
      let component = self.bridge.uiManager.view(
        forReactTag: node
      ) as! CounterView
      component.update(value: count)
    }
    // airplayVolume.removeFromSuperview()
  }
}
