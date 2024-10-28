//
//  mywidgetLiveActivity.swift
//  mywidget
//
//  Created by Jason.z on 2024/10/27.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct mywidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct mywidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: mywidgetAttributes.self) { context in
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

extension mywidgetAttributes {
    fileprivate static var preview: mywidgetAttributes {
        mywidgetAttributes(name: "World")
    }
}

extension mywidgetAttributes.ContentState {
    fileprivate static var smiley: mywidgetAttributes.ContentState {
        mywidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: mywidgetAttributes.ContentState {
         mywidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: mywidgetAttributes.preview) {
   mywidgetLiveActivity()
} contentStates: {
    mywidgetAttributes.ContentState.smiley
    mywidgetAttributes.ContentState.starEyes
}
