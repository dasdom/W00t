# W00t

Another stupid idea.

# Installation

Add the package to your iOS project.

# Usage

```
import UIKit
import W00t

class ViewController: UIViewController {
  
  private let w00t = W00t(image: UIImage(named: "corner"))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    w00t.add(to: view, size: CGSize(width: 300, height: 600))
  }
}
```

# Licence

MIT
