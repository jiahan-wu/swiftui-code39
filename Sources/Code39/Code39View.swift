//
//  Code39View.swift
//
//
//  Created by Jia-Han Wu on 2024/5/4.
//

import SwiftUI

public struct Code39View: View {
    
    public let content: String
    
    public init(_ content: String) {
        self.content = content
    }
    
    public var body: some View {
        Canvas { context, size in
            let prefixSuffixCount = 2
            
            let characterCount = content.count + prefixSuffixCount
            
            let gapCount = content.count + 1
            
            let weightPerCharacter = 15
            
            let totalUnits = (characterCount * weightPerCharacter) + gapCount
            
            let narrowBarWidth = size.width / CGFloat(totalUnits)
            
            var currentX: CGFloat = 0
            
            for (index, barWidth) in encodeToCode39(content).enumerated() {
                let barColor: Color = index % 2 == 0 ? .black : .white
                let barWidth: CGFloat = barWidth == .narrow ? narrowBarWidth : narrowBarWidth * 3
                var barPath = Path()
                let barRect = CGRect(x: currentX,
                                     y: 0,
                                     width: barWidth,
                                     height: size.height)
                currentX += barWidth
                barPath.addRect(barRect)
                context.fill(barPath, with: .color(barColor))
            }
        }
    }
}
