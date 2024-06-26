//
//  CoinDetailDataService.swift
//  CryproProfile
//
//  Created by Dima Kolesov on 27.04.2024.
//

import Foundation
import Combine

final class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    
    var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoins()
        
    }
    
    func getCoins() {
        guard let url = URL(string:
                                "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false")
        else { return }
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnCoinDetails in
                self?.coinDetails = returnCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
    }
}

