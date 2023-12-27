//
//  DetailView.swift
//  NEWZ
//
//  Created by Fahad Mansuri on 05.09.23.
//

import SwiftUI

struct DetailView: View {
    var url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
