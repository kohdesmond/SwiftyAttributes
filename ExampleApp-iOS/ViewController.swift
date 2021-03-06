//
//  ViewController.swift
//  ExampleApp-iOS
//
//  Created by Eddie Kaiger on 10/31/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import UIKit
import SwiftyAttributes

private let reuseIdentifier = "CellIdentifier"

class ViewController: UITableViewController {

    private let attributedStrings: [NSAttributedString] = [
        {
            let attachment = NSTextAttachment()
            attachment.image = UIImage(named: "Star")
            let str = NSMutableAttributedString(string: "Attachment  With Image")
            str.replaceCharacters(in: 10 ..< 12, with: NSAttributedString(attachment: attachment))
            return str
        }(),
        "Baseline Offset".withBaselineOffset(8.5),
        "Background Color".withBackgroundColor(.blue),
        "Expansion".withExpansion(0.8),
        "Font".withFont(.boldSystemFont(ofSize: 20)),
        "Kern".withKern(5.1),
        "Default Ligatures".withLigatures(.default),
        "No Ligatures".withLigatures(.none),
        "Link".withLink(URL(string: "https://google.com")!),
        "Obliqueness".withObliqueness(2),
        "Shadow".withShadow({
            let shadow = NSShadow()
            shadow.shadowBlurRadius = 2
            shadow.shadowOffset = CGSize(width: 3, height: -4)
            return shadow
        }()),
        "Stroke Color".withStrokeColor(.orange).withStrokeWidth(1),
        "Stroke Width".withStrokeWidth(2.7),
        "Strikethrough Style & Color".withStrikethroughColor(.green).withStrikethroughStyle(.styleDouble),
        "Text Color".withTextColor(.brown),
        "Text Effect".withTextEffect(.letterPressStyle),
        "Underline Style & Color".withUnderlineColor(.red).withUnderlineStyle(.styleDouble),
        "Writing Directions".withWritingDirections([.rightToLeftOverride]),
        "Multiple Attributes".withAttributes([.baselineOffset(5), .font(.boldSystemFont(ofSize: 20)), .kern(4), .underlineStyle(.styleSingle), .underlineColor(.magenta), .strokeColor(.orange), .strokeWidth(3), .strikethroughColor(.green), .strikethroughStyle(.styleSingle), .backgroundColor(.yellow)]),
        {
            let str = "Partial Range Attributes".withUnderlineStyle(.styleSingle)
            str.addAttributes([.underlineStyle(.styleDouble), .textColor(.blue)], range: 3 ..< 8)
            str.addAttributes([.strikethroughStyle(.styleThick), .strikethroughColor(.purple)], range: 16 ..< 22)
            str.setAttributes([.textColor(.red)], range: 22 ..< 24)
            return str
        }()
    ]

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.attributedText = attributedStrings[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attributedStrings.count
    }

}

