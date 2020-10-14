//
//  AnimationView.swift
//  Stemo
//
//  Created by Brett Henderson on 10/13/20.
//  Copyright © 2020 Brett Henderson. All rights reserved.
//

// adapted from Amos Gyamfi
//  Copyright © 2020 Amos Gyamfi. All rights reserved.

import Foundation
import SwiftUI

struct AnimationView: View {
    
    @State private var oneMoves = false
    @State private var twoMoves = false
    @State private var threeMoves = false
    @State private var fourMoves = false
    @State private var fiveMoves = false
    @State private var sixMoves = false
    @State private var sevenMoves = false
    @State private var eightMoves = false
    @State private var nineMoves = false
    @State private var tenMoves = false
    
    var body: some View {
     
//            Color(red: 0.0, green: 0.0, blue: 0.0)
//                .edgesIgnoringSafeArea(.all)
//            
//            Text("Wavy Circular Loader")
//                .font(.title)
//                .foregroundColor(Color(#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)))
//                .offset(y: -300)
        ZStack {
            
            
                Rectangle() // One
                    .stroke(lineWidth: 1)
                    .frame(width: 10, height: 10)
                    .foregroundColor(.white)
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: oneMoves ? -100 : 100)
                    .animation(Animation.easeInOut(duration: 10.0).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.oneMoves.toggle()
                }
                
                Rectangle()  // Two
                    .stroke(lineWidth: 1)
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: twoMoves ? -100 : 100)
                    .animation(Animation.easeInOut(duration: 10.0).repeatForever(autoreverses: true).delay(0.1))
                    .onAppear() {
                        self.twoMoves.toggle()
                }
                
                Rectangle()  // Three
                    .stroke(lineWidth: 1)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: threeMoves ? -100 : 100)
                    .animation(Animation.easeInOut(duration: 10.0).repeatForever(autoreverses: true).delay(0.2))
                    .onAppear() {
                        self.threeMoves.toggle()
                }
                
                Rectangle()  // Four
                    .stroke(lineWidth: 1)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: fourMoves ? -100 : 100)
                    .animation(Animation.easeInOut(duration: 10.0).repeatForever(autoreverses: true).delay(0.3))
                    .onAppear() {
                        self.fourMoves.toggle()
                }
                
                Rectangle()  // Five
                    .stroke(lineWidth: 1)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: fiveMoves ? -100 : 100)
                    .animation(Animation.easeInOut(duration: 10.0).repeatForever(autoreverses: true).delay(0.4))
                    .onAppear() {
                        self.fiveMoves.toggle()
                }
                
                Rectangle()  // Six
                    .stroke(lineWidth: 1)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: sixMoves ? -100 : 100)
                    .animation(Animation.easeInOut(duration: 10.0).repeatForever(autoreverses: true).delay(0.5))
                    .onAppear() {
                        self.sixMoves.toggle()
                }
                
                Rectangle()  // Seven
                    .stroke(lineWidth: 1)
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: sevenMoves ? -100 : 100)
                    .animation(Animation.easeInOut(duration: 10.0).repeatForever(autoreverses: true).delay(0.6))
                    .onAppear() {
                        self.sevenMoves.toggle()
                }
                
                Rectangle()  // Eight
                    .stroke(lineWidth: 1)
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: eightMoves ? -100 : 100)
                    .animation(Animation.easeInOut(duration: 10.0).repeatForever(autoreverses: true).delay(0.7))
                    .onAppear() {
                        self.eightMoves.toggle()
                }
                
                Rectangle()  // Nine
                    .stroke(lineWidth: 1)
                    .frame(width: 90, height: 90)
                    .foregroundColor(.white)
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: nineMoves ? -100 : 100)
                    .animation(Animation.easeInOut(duration: 10.0).repeatForever(autoreverses: true).delay(0.8))
                    .onAppear() {
                        self.nineMoves.toggle()
                }
                
                Rectangle()  // Ten
                    .stroke(lineWidth: 1)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                    .offset(y: tenMoves ? -100 : 100)
                    .animation(Animation.easeInOut(duration: 10.0).repeatForever(autoreverses: true).delay(0.9))
                    .onAppear() {
                        self.tenMoves.toggle()
                }
            
        }
//        .frame(width: 200, height: 100)
        .rotation3DEffect(.degrees(0), axis: (x: 0, y: 0, z: 180))

        .padding(.all, 0.0)
        .aspectRatio(contentMode: .fit)

        }
        
}


struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
