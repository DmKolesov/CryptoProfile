//
//  CoinDataService.swift
//  CryproProfile
//
//  Created by dmitri kolesov on 12.04.2024.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: Constants.coinURL)  else { return }
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnCoins in
                self?.allCoins = returnCoins
                self?.coinSubscription?.cancel()
            })
    }
}
