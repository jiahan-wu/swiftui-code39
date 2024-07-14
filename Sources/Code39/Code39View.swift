//
//  Code39View.swift
//
//
//  Created by Jia-Han Wu on 2024/5/4.
//

import SwiftUI

public struct Code39View: View {
    
    private let barcode: [BarWidth]
    
    public init(_ content: String) {
        self.barcode = encodeToCode39(content)
    }
    
    public var body: some View {
        Canvas { context, size in
            let intercharacterGapCount = (barcode.count % 9) - 1
            let narrowBarWidth = size.width / CGFloat(((((barcode.count - intercharacterGapCount) / 9) * 15) + intercharacterGapCount))
            var currentX: CGFloat = 0
            for (index, barWidth) in barcode.enumerated() {
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
