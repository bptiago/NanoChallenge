//
//  PhoneController.swift
//  nanohist
//
//  Created by Tiago Prestes on 01/08/25.
//

import SwiftUI

struct PhoneController: View {
    @State var isShowing = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .bottom) {
                
                if isShowing {
                    Rectangle()
                        .frame(width: 100, height: 200)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }

                
                Spacer()
                
                Rectangle()
                    .frame(width: 100, height: 100)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowing.toggle()
            }
        }
    }
}

#Preview {
    PhoneController()
}
