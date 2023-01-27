//
//  ScaledProgressView.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-27.
//

import SwiftUI

struct ScaledProgressView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(2)
            .frame(width: 200, height: 200)
    }
}

struct ScaledProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ScaledProgressView()
    }
}
