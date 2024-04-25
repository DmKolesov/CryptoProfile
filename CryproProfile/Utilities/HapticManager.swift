//
//  HapticManager.swift
//  CryproProfile
//
//  Created by Dima Kolesov on 25.04.2024.
//

import Foundation
import SwiftUI

final class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
