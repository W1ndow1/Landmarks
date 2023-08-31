//
//  CircleImageView.swift
//  Landmarks
//
//  Created by window1 on 2023/07/31.
//

import SwiftUI

struct CircleImageView: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("turtlerock"))
    }
}

