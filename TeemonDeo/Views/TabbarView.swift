//
//  TabbarView.swift
//  TeemonDeo
//
//  Created by 원주연 on 7/30/24.
//

import SwiftUI

struct TabbarView: View {
    
    @Binding var showSignInView: Bool
    @Binding var showOnboardingView: Bool
    
    var body: some View {
        NavigationStack{
            TabView {
                VStack {
                    ContentView()
                    PieChartView(data: iPhoneOperationSystem.dummyData())
                }
                .tag(0)
                .tabItem {
                    Image("tabbar1Image")
                    Text("챌린지")
                }
                
                ChallengeMainView()
                    .tag(1)
                    .tabItem {
                        Image("tabbar2Image")
                        Text("공개처형")
                    }
                
                SettingView(showSignInView: $showSignInView)
                    .tag(2)
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("관리")
                    }
            }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(showSignInView: .constant(false), showOnboardingView: .constant(false))
    }
}
