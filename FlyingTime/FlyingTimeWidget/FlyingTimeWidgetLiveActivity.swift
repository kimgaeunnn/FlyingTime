//
//  FlyingTimeWidgetLiveActivity.swift
//  FlyingTimeWidget
//
//  Created by gaeun on 2023/11/09.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct FlyingTimeWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct FlyingTimeWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FlyingTimeWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension FlyingTimeWidgetAttributes {
    fileprivate static var preview: FlyingTimeWidgetAttributes {
        FlyingTimeWidgetAttributes(name: "World")
    }
}

extension FlyingTimeWidgetAttributes.ContentState {
    fileprivate static var smiley: FlyingTimeWidgetAttributes.ContentState {
        FlyingTimeWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: FlyingTimeWidgetAttributes.ContentState {
         FlyingTimeWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: FlyingTimeWidgetAttributes.preview) {
   FlyingTimeWidgetLiveActivity()
} contentStates: {
    FlyingTimeWidgetAttributes.ContentState.smiley
    FlyingTimeWidgetAttributes.ContentState.starEyes
}
