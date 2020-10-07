import UIKit

var quartzView:QuartzView!
var context:CGContext?
var screenSize = CGSize()

class QuartzView: UIView {
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        quartzView = self
    }
    
    override func draw(_ dirtyRect: CGRect) {
        super.draw(dirtyRect)
        
        screenSize = quartzView.bounds.size

        context = UIGraphicsGetCurrentContext()
        
        // note: scaling only according to width
        context?.scaleBy(x: screenSize.width / SCREEN_XS, y: screenSize.width / SCREEN_YS)
        
        game.draw()
    }
    
    //MARK: -

//    func flippedYCoord(_ pt:NSPoint) -> NSPoint {
//        var npt = pt
//        npt.y = bounds.size.height - pt.y
//        return npt
//    }
//
//    override func mouseDown(with event: NSEvent) {
//        var pt = flippedYCoord(event.locationInWindow);
//        pt.x *= SCREEN_XS / screenSize.width
//        pt.y *= SCREEN_YS / screenSize.height
//    }
//
//    override func mouseDragged(with event: NSEvent) {}
//    override func mouseUp(with event: NSEvent) {}
    
    //MARK: -

    func refresh() { self.setNeedsDisplay(bounds) }
}

//MARK: -

func drawFilledRect(_ rect:CGRect, _ fillColor: CGColor) {
    let path = CGMutablePath()
    path.addRect(rect)
    context?.setFillColor(fillColor)
    context?.addPath(path)
    context?.drawPath(using:.fill)
}

func drawFilledRect(_ x:Int, _ y:Int, _ xs:Int, _ ys:Int, _ fillColor: CGColor) {
    drawFilledRect(CGRect(x:CGFloat(x), y:CGFloat(y), width:CGFloat(xs), height:CGFloat(ys)), fillColor)
}

func drawText(_ x:CGFloat, _ y:CGFloat, _ txt:String, _ fontSize:Int, _ color:UIColor, _ justifyCode:Int) {  // 0,1,2 = left,center,right
    let a1 = NSMutableAttributedString(
        string: txt,
        attributes: [
            kCTFontAttributeName as NSAttributedString.Key:UIFont(name: "Helvetica", size: CGFloat(fontSize))!,
            NSAttributedString.Key.foregroundColor : color
    ])
    
    var cx = CGFloat(x)
    let size = a1.size()

    switch justifyCode {
    case 1 : cx -= size.width/2
    case 2 : cx -= size.width
    default : break
    }
    
    a1.draw(at: CGPoint(x:cx, y:CGFloat(y)))
}

func drawRectangle(_ x:CGFloat, _ y:CGFloat, _ xs:CGFloat, _ ys:CGFloat) {
    context?.stroke(CGRect(x:x,y:y,width:xs,height:ys)) }

func drawFilledRectangle(_ x:CGFloat, _ y:CGFloat, _ xs:CGFloat, _ ys:CGFloat)  {
    context?.fill(CGRect(x:x,y:y,width:xs,height:ys)) }

