
import UIKit

public class W00t : UIImageView {
  
  private var animators: [UIViewPropertyAnimator] = []
  
  public override init(image: UIImage?) {
    
    super.init(image: image)
    
    removeFromSuperview()
    contentMode = .scaleAspectFit
        
    NotificationCenter.default.addObserver(self, selector: #selector(willResignActive), name: UIApplication.willResignActiveNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    
    frame.origin.x = UIScreen.main.bounds.width
    isHidden = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func add(to view: UIView, size: CGSize) {
    view.addSubview(self)
    
    frame.size = size
    frame.origin.x = UIScreen.main.bounds.width
    center.y = view.center.y
    isHidden = true
  }
  
  @objc func willResignActive() {
    isHidden = false
    
    animators.forEach { animator in
      animator.stopAnimation(true)
    }
    animators.removeAll()
    
    let animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.8, delay: 0.8, options: [], animations: {
      self.frame.origin.x = 0
    }) { position in
      let animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.8, delay: 1.8, options: [], animations: {
        self.frame.origin.x = UIScreen.main.bounds.width
      }, completion: { position2 in
        self.isHidden = true
      })
      self.animators.append(animator)
    }
    animators.append(animator)
  }
  
  @objc func didEnterBackground() {
    animators.forEach { animator in
      animator.stopAnimation(true)
    }
    animators.removeAll()
    isHidden = true
    frame.origin.x = UIScreen.main.bounds.width
  }
  
  @objc func didBecomeActive() {
    isHidden = true
    frame.origin.x = UIScreen.main.bounds.width
  }
}
