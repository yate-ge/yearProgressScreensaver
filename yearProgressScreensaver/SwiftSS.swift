import ScreenSaver


//class SwiftSS: ScreenSaverView {
//
//
//    override func draw(dirtyRect: NSRect) {
//        super.drawRect(dirtyRect)
//
//
//        NSColor.redColor().setFill()
//        NSRectFill(self.bounds)
//        NSColor.blackColor().set()
//
//
//        let hello:NSString = "hello SWIFT screen saver plugin"
//        hello.drawAtPoint(NSPoint(x: 100.0, y: 200.0), withAttributes:nil)
//    }
//
//
//}

//
//
class SwiftSS: ScreenSaverView {
    
//    override func draw(_ rect: NSRect) {
//        super.draw(rect)
//
//        NSColor.setFill(NSColor.red)
//        NSRectFill(self.bounds)
//        NSColor.set(NSColor.black)
//
//    }
    
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        
    }
}




