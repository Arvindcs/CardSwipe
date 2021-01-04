

import UIKit

func getWidth() -> CGFloat {
    let screen = UIScreen.main.bounds.width - 50
    let width = screen - (2 * 30)
    return width
}
