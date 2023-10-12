//
//  WorkoutInfoItem.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import SwiftUI

struct WorkoutInfoItem: View {
    var data: String
    var imageName: String
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                Text(data)
                    .foregroundColor(.white)
                    .font(.headline)
                    .offset(y: -2)
            }
            
            ZStack {
                Circle()
                    .fill(Color.primary)
                    .frame(width: 25, height: 25)
                Image(systemName: imageName)
                    .font(.caption)
                    .foregroundStyle(Color.white)
                    .blendMode(.difference)
            }
            .offset(y: -25)
        }
        .offset(y: 12.5)
    }
}

//#Preview {
//    WorkoutInfoItem()
//}
