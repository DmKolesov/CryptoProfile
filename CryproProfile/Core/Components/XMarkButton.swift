//
//  XMarkButton.swift
//  CryproProfile
//
//  Created by dmitri kolesov on 13.04.2024.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var presentationMode
    
    var body: some View {
        Button {
            presentationMode.callAsFunction()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
