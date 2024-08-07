//
//  RecoverySheetView.swift
//  SMSWithoutBorders-Production
//
//  Created by sh3rlock on 07/08/2024.
//

import SwiftUI
import CountryPicker

struct RecoverySheetView: View {
    #if DEBUG
        @State private var phoneNumber: String = "1234567"
        @State private var password: String = "LL<O3ZG~=z-epkv"
        @State private var rePassword: String = "LL<O3ZG~=z-epkv"
        @State private var selectedCountryCodeText: String? = "CM"
    #else
        @State private var phoneNumber: String = ""
        @State private var password: String = ""
        @State private var rePassword: String = ""
        @State private var selectedCountryCodeText: String? = "Select country"
    #endif

    @State private var country: Country?
    @State private var showCountryPicker = false
    
    @State private var isLoading = false
    
    @State private var OTPRequired = false
    
    @Binding var completed: Bool
    @Binding var failed: Bool
    
    @State private var acceptTermsConditions: Bool = false

    @State var otpRetryTimer: Int = 0
    @State var errorMessage: String = ""

    var body: some View {
        if(OTPRequired) {
            OTPSheetView(type: OTPAuthType.TYPE.CREATE,
                         retryTimer: otpRetryTimer,
                         phoneNumber: $phoneNumber,
                         countryCode: $selectedCountryCodeText,
                         password: $password,
                         completed: $completed,
                         failed: $failed)
        }
        else {
            VStack {
                VStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75, height: 75)
                        .padding()

                    Text("Forgot password?")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    Group {
                        Text("If you forgot your password")
                        Text("Enter your phone number and new passwords")
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                }
                .padding(.bottom, 30)
                
                VStack {
                    HStack {
                         Button {
                             showCountryPicker = true
                         } label: {
                             let flag = country?.isoCode ?? Country.init(isoCode: "CM").isoCode
                             Text(flag.getFlag() + "+" + (country?.phoneCode ?? Country.init(isoCode: "CM").phoneCode))
                                .foregroundColor(Color.gray)
                         }.sheet(isPresented: $showCountryPicker) {
                             CountryPicker(country: $country,
                                           selectedCountryCodeText: $selectedCountryCodeText)
                         }
                         Spacer()
                         TextField("Phone Number", text: $phoneNumber)
                             .keyboardType(.numberPad)
                             .textContentType(.emailAddress)
                             .autocapitalization(.none)
                    }
                    .padding(.leading)
                    Rectangle().frame(height: 1).foregroundColor(.gray)
                        .padding(.bottom, 20)
                    
                    SecureField("Password", text: $password)
                    Rectangle().frame(height: 1).foregroundColor(.gray)
                        .padding(.bottom, 20)
                    
                    SecureField("Re-enter password", text: $rePassword)
                    Rectangle().frame(height: 1).foregroundColor(.gray)
                        .padding(.bottom, 20)
                    
                }
                .padding()
                Spacer()
                
                VStack {
                    if(self.isLoading) {
                        ProgressView()
                    } else {
                        Button {
                            self.isLoading = true
                            
                        } label: {
                            Text("Continue")
                                .bold()
                                .frame(maxWidth: .infinity, maxHeight: 35)
                        }
                        .buttonStyle(.borderedProminent)
                        .alert(isPresented: $failed) {
                            Alert(title: Text("Error"), message: Text(errorMessage))
                        }
                        .padding(.bottom, 20)
                        Button("Already got SMS code") {
                            OTPRequired = true
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    @State var completed: Bool = false
    @State var failed: Bool = false
    RecoverySheetView(completed: $completed, failed: $failed)
}