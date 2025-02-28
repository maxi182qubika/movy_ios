//
//  TermsTextView.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 26/02/2025.
//

import SwiftUI

struct TermsTextView: View {
    var body: some View {
        
        Text("La disponibilidad del contenido HD y Ultra HD depende de tu proveedor de servicios de internet y del dispositivo en uso. No todo el contenido está disponible en HD o Ultra HD. Consulta los **[Terminos de uso](https://google.com)** para obtener mas informacion.")
            .font(.system(size: 14, weight: .regular))
            .tint(Color.customBlueLight)
             
    }
}

struct TermsTextView_Previews: PreviewProvider {
    static var previews: some View {
        TermsTextView()
            .padding()
    }
}
