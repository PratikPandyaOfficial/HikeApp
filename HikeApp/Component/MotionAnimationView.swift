//
//  MotionAnimationView.swift
//  HikeApp
//
//  Created by Drashti on 22/08/23.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - Properties
    
    @State private var randomCircle: Int = Int.random(in: 6...10)
    @State private var isAnimating: Bool = false
    // MARK: - Functions
    
    // 1. Random Coordinate
    func randomCoordinate() -> CGFloat{
        return CGFloat.random(in: 0...256)
    }
    // 2. Random Size
    func randomSize() -> CGFloat{
        return CGFloat.random(in: 4...80)
    }
    // 3. Random Scale
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. Random Speed
    func randomSpeed() -> Double{
        return Double.random(in: 0.05...1.0)
    }
    // 5. Random Delay
    func randomDelay() -> Double{
        return Double.random(in: 0...2)
    }
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear {
                        withAnimation (
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                            isAnimating = true
                        }
                    }
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        
        MotionAnimationView()
            .background(
                Circle()
                    .fill(.teal)
            )
        
    }
}
