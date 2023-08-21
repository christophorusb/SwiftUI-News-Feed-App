//
//  ResizableImageView.swift
//  CNNBonaFide
//
//  Created by Christophorus Beneditto Aditya Satrio on 13/08/23.
//

import SwiftUI

struct ResizableImageView: View {
    let url: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: "\(url)")) {
            phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            // Error found
            else if phase.error != nil {
                RoundedRectangle(cornerRadius: 10)
            }
            // Other phase ( image loading etc )
            else {
                RoundedRectangle(cornerRadius: 10)
                    .background(Color.gray)
            }
        }
        .frame(width: width, height: height)
    }
}

struct ResizableImageView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableImageView(url: "https://akcdn.detik.net.id/visual/2023/08/05/semrawutnya-kabel-utilitas-di-jakarta-5_169.jpeg?w=360&q=100", width: 100, height: 100)
    }
}
