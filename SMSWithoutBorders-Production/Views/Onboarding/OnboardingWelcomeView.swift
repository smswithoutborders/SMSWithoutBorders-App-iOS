//
//  SwiftUIView.swift
//  SMSWithoutBorders-Production
//
//  Created by sh3rlock on 13/06/2024.
//

import SwiftUI

struct OnboardingWelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to RelaySMS")
                .font(.title)
                .fontWeight(.semibold)
                
                
            VStack {
                Text("Use SMS to make a post, send an email or message your closed ones")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                Image("OnboardingWelcome")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)
                

                Button("English", systemImage: "globe") {
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.secondary)
                .cornerRadius(38.5)

            }.padding()
            
            
            Spacer()
        }
            
    }
}

#Preview {
    OnboardingWelcomeView()
}
