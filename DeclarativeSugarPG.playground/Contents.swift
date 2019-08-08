//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport


typealias LiveViewVC = ViewController

class ViewController: DeclarativeViewController {
    
    override func build() -> DZWidget {
        return DZListView(
            tableView: UITableView().then { $0.separatorStyle = .singleLine },
            sections: [
                DZSection(
                    cells: [
                        DZCell(
                            cellHeight: 45,
                            widget: DZCenter(child: UILabel().then { $0.text = "hello world"; $0.font = UIFont.systemFont(ofSize: 24) })),
                        DZCell(
                            widget: DZColumn(
                                children: [
                                    DZPadding(
                                        edgeInsets: DZEdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                        child: UILabel().then {
                                            $0.numberOfLines = 0
                                            $0.text =
                                            """
                                            Swift is a general-purpose, multi-paradigm, compiled programming language created for iOS, OS X, watchOS, tvOS and Linux development by Apple Inc. Swift is designed to work with Apple's Cocoa and Cocoa Touch frameworks and the large body of existing Objective-C code written for Apple products
                                            """
                                    }),
                                    DZSpacer(10),
                                    DZPadding(
                                        edgeInsets: DZEdgeInsets.all(15),
                                        child:UISwitch()
                                    ),
                                    DZSpacer(20),
                                ])),
                    ]).then { $0.headerTitle = "section 0"; $0.headerHeight = 30 },
                DZSection(
                    cells: [
                        DZCell(
                            widget: DZPadding(
                                edgeInsets: DZEdgeInsets.all(16),
                                child: DZRow(
                                    mainAxisAlignment: UIStackView.Distribution.fillProportionally,
                                    children: [
                                        DZSizedBox(width: 50, height: 50, child: UIImageView(image: UIImage(named: "icon"))),
                                        DZSpacer(20),
                                        DZColumn(
                                            children: [
                                                UILabel().then { $0.text = "Darren"},
                                                DZSpacer(5),
                                                UILabel().then { $0.text = "Dart is way better than Swift"; $0.textColor = .gray },
                                            ])
                                    ])
                        )).then { $0.configureCell = { $0.accessoryType = .disclosureIndicator } }
                    ]).then { $0.headerTitle = "section 1"; $0.headerHeight = 30 }
            ])
    }
    
}




/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

let vc = LiveViewVC()
vc.preferredContentSize = CGSize(width: 375, height: 667)
vc.view.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = vc
