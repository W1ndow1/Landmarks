//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by window1 on 2023/08/18.
//

import SwiftUI

struct BadgeSymbol: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75       //도형의 하단 꼭지점 수직 위치
                let spacing = width * 0.030     //가운데 꼭지점의 위치
                let middle = width * 0.5        //도형의 수평 위치
                let topWidth = width * 0.266    //도형의 양 날개 꼭지점 수평 위치
                let topHeight = height * 0.488  //도형의 하단 꼭지점 수직 위치
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing),
                ])
                
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
            }
            .fill(Self.symbolColor)
        }
    }
    static let symbolColor = Color(red: 79.0/255, green: 79.0/255, blue: 191.0/255)
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
