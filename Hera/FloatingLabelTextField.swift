//
//  FloatingLabelTextField.swift
//  Hera
//
//  Created by KiwiTech on 23/11/23.
//

import SwiftUI

struct FloatingLabelTextField: View {
    @Binding var text: String
    @State private var isSecureTextEntry = true
    @FocusState private var isFocused: Bool
    @State private var isSecure = false
    var label: String
    var Password: Bool=false
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
                       Text(label)
                           .font(.custom("OpenSans", size: 14.0))
                           .foregroundColor(Color(white: 0.0))
                           .transition(.move(edge: .leading))
                           .animation(.easeInOut)
                           .offset(y: (text.isEmpty && !isFocused) ? 20 : 0)
                   
            HStack {
                if isSecure {
                    SecureField("", text: $text,onCommit: {
                        isFocused = true
                    })
                      .font(.custom("OpenSans", size: 14.0))
                      .foregroundColor(Color(white: 0.0))
                      .padding(.bottom, 8)
                } else {
                    TextField("", text: $text, onEditingChanged: { editing in
                                            isFocused = editing
                                        })
                        .font(.custom("OpenSans", size: 14.0))
                        .foregroundColor(Color(white: 0.0))
                        .padding(.bottom, 8)
                }
                if Password {
                    Button(action: {
                        isSecureTextEntry.toggle();
                        isSecure.toggle();
                    }) {  
                        Image( isSecureTextEntry ? "EyeClose":"Eye")
                                .foregroundColor(.gray)
                                .frame(width: 18.0, height: 18.0)
                           }
                }}
            Rectangle()
                .foregroundColor(Color(red: 228.0 / 255.0, green: 226.0 / 255.0, blue: 216.0 / 255.0))
                .frame(height: 1.0)
        }
        .padding(.horizontal)
    }
}
struct FloatingLabelTextField_Previews: PreviewProvider {
    static var previews: some View {
        FloatingLabelTextField( text: .constant(""),label: "Example Label",Password:false)
    }
}
