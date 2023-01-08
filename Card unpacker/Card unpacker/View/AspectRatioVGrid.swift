//
//  AspectRatioVGrid.swift
//  Card unpacker
//
//  Created by delano sergeant on 08/01/2023.
//

import SwiftUI

//comes from the ciriculum 
struct AspectRatioVGrid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    private let items: [Item]
    private let aspectRatio: CGFloat
    private let spacing: CGFloat
    private let content: (Item) -> ItemView
        
    init(
        _ items: [Item],
        aspectRatio: CGFloat,
        spacing: CGFloat,
        @ViewBuilder content: @escaping (Item) -> ItemView
    ) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width: CGFloat = width(fitting: geometry.size)
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: width), spacing: spacing)],
                spacing: spacing
            ) {
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
    }
    }
    
    private func width(fitting size: CGSize) -> CGFloat {
        guard !items.isEmpty else {
            return size.width
        }
        var columns = 1
        while columns < items.count {
            let availableWidth = size.width - (CGFloat(columns) - 1) * spacing
            let cardWidth = availableWidth / CGFloat(columns)
            let cardHeight = cardWidth / aspectRatio
            let rows = (items.count + columns - 1) / columns
            let totalHeight = CGFloat(rows) * cardHeight + (CGFloat(rows) - 1) * spacing
            if totalHeight <= size.height {
                break // We found the ideal size.
            } else {
                columns += 1
            }
        }
        let availableWidth = size.width - (CGFloat(columns) - 1) * spacing
        return (availableWidth / CGFloat(columns)).rounded(.down)
    }
}
