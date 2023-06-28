//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

struct MainView: View {
    @State private var awardIsShowing = false
   
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                Text(awardIsShowing ? "Hide Award" : "Show Award")
                Spacer()
                Image(systemName: "chevron.up.square")
                    .rotationEffect(.degrees(awardIsShowing ? 0 : 180))
                    .scaleEffect(awardIsShowing ? 2 : 1)
            }
            
            Spacer()
            
            if awardIsShowing {
                Badge()
                    .rotation3DEffect(.degrees(45), axis: (x: 0, y: 1, z: -1))
                    .frame(width: 450, height: 450)
                    .transition(.customTransition)
            }
            
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation {
            awardIsShowing.toggle()
        }
    }
}

extension AnyTransition {
    
    static var customTransition: AnyTransition {
        
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
            .combined(with: identity)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: .scale)
            .combined(with: identity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
