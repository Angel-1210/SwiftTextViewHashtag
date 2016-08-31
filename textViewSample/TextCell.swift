//
//  TextCell.swift
//  textViewSample
//
//  Created by Robert Chen on 5/8/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class TextCell : UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var lblComment: ResponsiveLabel!
    
    func setCellText(text:String){
        //textView.text = text
        textView.resolveHashTags()
        lblComment.text = text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textView.hidden = true
        
        lblComment.userInteractionEnabled = true

        let block: @convention(block) (NSString!) -> Void = {
            (string: NSString!) -> Void in
            print(string)
        }
        
        self.lblComment.enableUserHandleDetectionWithAttributes([NSForegroundColorAttributeName: UIColor.grayColor(), RLHighlightedForegroundColorAttributeName: UIColor.greenColor(), RLHighlightedBackgroundColorAttributeName: UIColor.blackColor(), RLTapResponderAttributeName: unsafeBitCast(block, AnyObject.self)])
        
        //lblComment.enableStringDetection("test string", withAttributes: [NSForegroundColorAttributeName: UIColor.redColor(), RLTapResponderAttributeName: unsafeBitCast(block, AnyObject.self)])

    }
}
