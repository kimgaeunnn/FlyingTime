//
//  FlyingTimeWidgetBundle.swift
//  FlyingTimeWidget
//
//  Created by gaeun on 2023/11/09.
//

import WidgetKit
import SwiftUI

@main
struct FlyingTimeWidgetBundle: WidgetBundle {
    var body: some Widget {
        FlyingTimeWidget()
        FlyingTimeWidgetLiveActivity()
    }
}
