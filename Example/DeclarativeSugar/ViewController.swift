//
//  ViewController.swift
//  DeclarativeSugar
//
//  Created by 623767307@qq.com on 08/01/2019.
//  Copyright (c) 2019 623767307@qq.com. All rights reserved.
//

import UIKit
import SnapKit
import DeclarativeSugar
import Then

/////////////////////////////////////////////////////
// Full Reload Example
/////////////////////////////////////////////////////

//class ViewController: DeclarativeViewController {
//
//    var hide = false
//
//    override func build() -> DZWidget {
//        return DZColumn(
//            crossAxisAlignment: .leading,
//            children: [
//                DZRow(
//                    crossAxisAlignment: .bottom,
//                    children: [
//                        UILabel().then { $0.text = "Press Background!"; $0.isHidden = self.hide },
//                        UIView().then {
//                            $0.backgroundColor = .red
//                            $0.snp.makeConstraints { make in
//                                make.size.equalTo(CGSize(width: 50, height: 100))
//                            }
//                        },
//                        DZSpacer(40),
//                        UIView().then {
//                            $0.backgroundColor = .blue
//                            $0.snp.makeConstraints { make in
//                                make.size.equalTo(CGSize(width: 50, height: 50))
//                            }
//                        },
//                    ]),
//                DZSpacer(self.hide ? 10 : 50),
//                UIView().then {
//                    $0.backgroundColor = .orange
//                    $0.snp.makeConstraints { make in
//                        make.size.equalTo(CGSize(width: 50, height: 50))
//                    }
//                },
//                DZSpacer(10),
//                UILabel().then {
//                    $0.numberOfLines = 0
//                    $0.text =
//                    """
//                    Swift is a general-purpose, multi-paradigm, compiled programming language created for iOS, OS X, watchOS, tvOS and Linux development by Apple Inc. Swift is designed to work with Apple's Cocoa and Cocoa Touch frameworks and the large body of existing Objective-C code written for Apple products
//                    """
//                },
//            ])
//            .then {
//                view.addSubview($0)
//                $0.snp.makeConstraints {
//                    $0.top.equalToSuperview().offset(300)
//                    $0.left.right.equalToSuperview()
//                }
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        // full reload
//        self.rebuild {
//            self.hide = !self.hide
//        }
//    }
//
//}

/////////////////////////////////////////////////////
// Incremental Reload Example
/////////////////////////////////////////////////////

//class ViewController: DeclarativeViewController {
//
//    var label = UILabel().then { $0.text = "Press Background!" }
//    var spacer = DZSpacer(10);
//    var hide = false
//
//    override func build() -> DZWidget {
//        return DZColumn(
//            crossAxisAlignment: .leading,
//            children: [
//                DZRow(
//                    crossAxisAlignment: .bottom,
//                    children: [
//                        label,
//                        UIView().then {
//                            $0.backgroundColor = .red
//                            $0.snp.makeConstraints { make in
//                                make.size.equalTo(CGSize(width: 50, height: 100))
//                            }
//                        },
//                        DZSpacer(10),
//                        UIView().then {
//                            $0.backgroundColor = .blue
//                            $0.snp.makeConstraints { make in
//                                make.size.equalTo(CGSize(width: 50, height: 50))
//                            }
//                        },
//                    ]),
//                spacer,
//                UIView().then {
//                    $0.backgroundColor = .orange
//                    $0.snp.makeConstraints { make in
//                        make.size.equalTo(CGSize(width: 50, height: 50))
//                    }
//                },
//                DZSpacer(10),
//                UILabel().then {
//                    $0.numberOfLines = 0
//                    $0.text =
//                    """
//                    Swift is a general-purpose, multi-paradigm, compiled programming language created for iOS, OS X, watchOS, tvOS and Linux development by Apple Inc. Swift is designed to work with Apple's Cocoa and Cocoa Touch frameworks and the large body of existing Objective-C code written for Apple products
//                    """
//                },
//            ])
//            .then {
//                view.addSubview($0)
//                $0.snp.makeConstraints {
//                    $0.top.equalToSuperview().offset(300)
//                    $0.left.right.equalToSuperview()
//                }
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        // incremental reload
//        UIView.animate(withDuration: 0.5) {
//            self.hide = !self.hide
//            self.context.setSpacing(self.hide ? 50 : 10, for: self.spacer)
//            self.context.setHidden(self.hide, for: self.label)
//        }
//    }
//}



/////////////////////////////////////////////////////
// ListView Example
/////////////////////////////////////////////////////


class ViewController: DeclarativeViewController {
    override func build() -> DZWidget {
        return DZListView(
            tableView: UITableView().then { $0.separatorStyle = .singleLine },
            sections: [
                DZListSection(
                    rows: [
                        DZListCell(
                            widget: DZColumn(
                                children: [
                                    DZPadding(
                                        edgeInsets: DZEdgeInsets.only(left: 10, top: 8, right: 10, bottom: 8),
                                        child: UILabel().then { $0.text = "hello world" }
                                    ),
                                ])),
                        DZListCell(
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
                                    UISwitch(),
                                    DZSpacer(20),
                                ])),
                    ]).then { $0.headerTitle = "section 1"; $0.headerHeight = 20 },
                DZListSection(
                    rows: [
                        DZListCell(
                            widget: DZPadding(
                                edgeInsets: DZEdgeInsets.all(16),
                                child: DZRow(
                                    children: [
                                        UIImageView(image: UIImage(named: "1"))
                                            .then{ $0.snp.makeConstraints { $0.size.equalTo(CGSize(width: 50, height: 50)) }},
                                        DZSpacer(20),
                                        DZColumn(
                                            children: [
                                                UILabel().then { $0.text = "Darren"},
                                                DZSpacer(5),
                                                UILabel().then { $0.text = "Dart is way better than Swift"; $0.textColor = .gray },
                                            ])
                                    ])
                        )).then { $0.configureCell = { $0.accessoryType = .disclosureIndicator } }
                    ]).then { $0.headerTitle = "section 2"; $0.headerHeight = 20}
            ]).then { view.addSubview($0); $0.snp.makeConstraints { $0.edges.equalToSuperview() } }
    }
}

