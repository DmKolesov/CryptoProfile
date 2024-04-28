//
//  test.swift
//  CryproProfile
//
//  Created by Dima Kolesov on 25.04.2024.
//

import SwiftUI

struct test: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(viewModel.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading
        )
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}


//var body: some View {
//    HStack {
//        ForEach(viewModel.statistics) { stat in
//            StatisticView(stat: stat)
//                .frame(width: UIScreen.main.bounds.width / 3)
//        }
//    }
//    .frame(width: UIScreen.main.bounds.width,
//           alignment: showPortfolio ? .trailing : .leading
//    )
//}
