//
//  DetailView.swift
//  CryproProfile
//
//  Created by Dima Kolesov on 25.04.2024.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    var coin: CoinModel
    
    
    init(coin: CoinModel) {
        self.coin = coin
    }
    var body: some View {
        Text(coin.name)
    }
}

//#Preview {
//    DetailView(coin: dev.coin)
//}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
