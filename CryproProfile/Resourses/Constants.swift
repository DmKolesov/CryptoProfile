//
//  Constants.swift
//  CryproProfile
//
//  Created by dmitri kolesov on 12.04.2024.
//

import Foundation

enum Constants {
    static let coinURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    static let coinImageURL = "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
    static let marketURL = "https://api.coingecko.com/api/v3/global"
}
