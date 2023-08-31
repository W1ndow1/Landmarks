//
//  FeatureCard.swift
//  Landmarks
//
//  Created by window1 on 2023/08/23.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    var body: some View {
        landmark.featureIamge?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            //SwiftUI는 하위 뷰를 넣기 위해 overlay를 사용한다
            .overlay {
                TextOverlay(landmark: landmark)
            }
        
    }
}

struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(Gradient(colors: [.pink.opacity(0.5), .cyan.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
    
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
