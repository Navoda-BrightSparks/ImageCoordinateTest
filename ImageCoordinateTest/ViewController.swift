//
//  ViewController.swift
//  Wayl
//
//  Created by Navoda Sathsarani on 8/1/18.
//  Copyright © 2018 codezync. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var horizontalLine: UIView!
    
    @IBOutlet weak var gameImageHeight: NSLayoutConstraint!
    @IBOutlet weak var gameImageWidth: NSLayoutConstraint!
    @IBOutlet weak var verticalLineHeight: NSLayoutConstraint!
    @IBOutlet weak var horizontalLinewidth: NSLayoutConstraint!
    @IBOutlet weak var verticalLine: UIView!
    @IBOutlet weak var gameImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        horizontalLinewidth.constant = self.view.frame.width
        verticalLineHeight.constant = self.view.frame.height
        print(view.center.x)
        print(view.center.y)
        if let horizontalframe = horizontalLine.superview?.convert(horizontalLine.frame, to: nil) {
            if let verticalframe = verticalLine.superview?.convert(verticalLine.frame, to: nil) {
                
                let intersect = horizontalframe.intersection(verticalframe)
                print(intersect)
            }
            
            
        }
        if let verticalframe = verticalLine.superview?.convert(verticalLine.frame, to: nil) {
            
            print(verticalframe)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ScaleImage(_ sender: Any) {
        gameImage.transform = CGAffineTransform(scaleX: (sender as AnyObject).scale, y: (sender as AnyObject).scale)
        
    }
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
            
            print(view.center.x + translation.x)
            print(view.center.y + translation.y)
        }
        
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
  
    @IBAction func getIntersection(_ sender: Any) {
        
        print("image width\(String(describing: self.gameImage.image?.size.width))")
        print("image height\(String(describing: self.gameImage.image?.size.height))")
        print("frame width\(gameImage.frame.width)")
        print( "frame heght\(gameImage.frame.height)")
        
        // var touchPoint = tapGestureRecognizer.location(in: self.imageView)
        print(view.center.x)
        print(view.center.y)
        let  touchPointX = view.center.x *  (gameImage.image?.size.width)! / gameImage.frame.width
        let  touchPointY = view.center.y *  (gameImage.image?.size.height)! / gameImage.frame.height
        
        print("x cordinate:\(touchPointX)" )
        print("y cordinate:\(touchPointY)" )
    }
   
}
extension ViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
