//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by window1 on 2023/08/25.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    
    var body: some View {
        VStack {
            if landmark != nil {
                CircleImageView(image: landmark?.image.resizable() ?? Image(systemName: "Star"))
                    .scaledToFit()
            }
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(title: "Turtle Rock",
                         message: "You are within 5 miles of TurtleRock",
                         landmark: ModelData().landmarks[0])
    }
}
