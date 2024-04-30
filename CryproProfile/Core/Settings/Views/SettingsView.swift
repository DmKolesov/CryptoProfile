//
//  SettingsView.swift
//  CryproProfile
//
//  Created by Dima Kolesov on 30.04.2024.
//

import SwiftUI

struct SettingsView: View {
 
    var body: some View {
        NavigationStack {
            List {
                coinGeckoSection
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView()
        }
    }
}

private extension SettingsView {
    var coinGeckoSection: some View {
        Section {
            VStack(alignment: .leading, content: {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            })
        } header: {
            Text("CoinGecko")
        }
        .padding(.vertical)
    }
}
