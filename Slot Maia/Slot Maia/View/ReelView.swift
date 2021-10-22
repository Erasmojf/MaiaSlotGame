//
//  RealView.swift
//  Slot Maia
//
//  Created by Erasmo J.F Da Silva on 20/10/21.
//  SwiftUI ♡ Better Apps. Less Code
//  https://erasmojf.github.io/
//  Fidju de Bideira de Feira de Caracol

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier())
    }
}

struct RealView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
            .previewLayout(.fixed(width: 220, height: 220))
    }
}
