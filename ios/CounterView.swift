import UIKit
import MediaPlayer

class CounterView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(button)
    increment()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  lazy var button: UIButton = {
    let b = UIButton.init(type: UIButton.ButtonType.system)
    b.titleLabel?.font = UIFont.systemFont(ofSize: 50)
    b.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    b.addTarget(
      self,
      action: #selector(increment),
      for: .touchUpInside
    )
    return b
  }()
  
  @objc func update(value: NSNumber) {
    let rect = CGRect(x: 10, y: 10, width: 100, height: 100) 
    let airplayVolume = MPVolumeView(frame: rect)
    airplayVolume.showsVolumeSlider = true
    airplayVolume.showsRouteButton = true
    self.addSubview(airplayVolume)
    for view: UIView in airplayVolume.subviews {
        if let button = view as? UIButton {
            button.sendActions(for: .touchUpInside)
            break
        }
    }
  }

}
