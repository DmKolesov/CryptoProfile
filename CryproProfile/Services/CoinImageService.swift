//
//  CoinImageService.swift
//  CryproProfile
//
//  Created by dmitri kolesov on 12.04.2024.
//

import Foundation
import SwiftUI
import Combine

final class CoinImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let saveImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = saveImage
            print("Retrieved image from FileManager")
        } else {
            donwloadCoinImage()
            print("Download Image nowww")
        }
    }
    
    private func donwloadCoinImage() {
        guard let url = URL(string: coin.image)  else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })

            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnImage in
                guard let self = self, let downloadedImage = returnImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, foldelName: self.folderName)
            })
    }
}
