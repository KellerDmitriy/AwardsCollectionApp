//
//  Badge.swift
//  AwardsCollectionApp
//
//  Created by Келлер Дмитрий on 28.06.2023.
//

import SwiftUI


struct Badge: View {
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            HStack {
                GeometryReader { geometry in
                    badgeSymbols
                        .scaleEffect(1.0 / 4.0, anchor: .top)
                        .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
                }
            }
            Image(systemName: "heart")
                .resizable()
                .opacity(0.5)
                .scaleEffect(0.0999)
                .foregroundColor(BadgeSymbol.symbolColor)
        }
        
        .scaledToFit()
    }
}


struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
