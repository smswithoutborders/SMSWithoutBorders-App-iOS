//
//  ContentView.swift
//  SMSWithoutBorders-Production
//
//  Created by Sherlock on 9/5/22.
//

import SwiftUI
import MessageUI


extension EmailView {
    private class MessageComposerDelegate: NSObject, MFMessageComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            // Customize here
            controller.dismiss(animated: true)
        }
    }
}

struct EmailView: View {
    @Environment(\.managedObjectContext) var datastore
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
//    @FetchRequest(entity: GatewayClientsEntity.entity(), sortDescriptors: []) var gatewayClientsEntities: FetchedResults<GatewayClientsEntity>
//    
    @FetchRequest var platforms: FetchedResults<PlatformsEntity>

    @State var composeTo: String = ""
    @State var composeFrom: String = ""
    @State var composeCC: String = ""
    @State var composeBCC: String = ""
    @State var composeSubject: String = ""
    @State var composeBody: String = ""
    
    private var platformName: String
    private var fromAccount: String

    init(platformName: String, fromAccount: String) {
        self.platformName = platformName
        
        _platforms = FetchRequest<PlatformsEntity>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "name == %@", platformName))
        
        self.fromAccount = fromAccount
    }
    
    var decoder: Decoder?
    private let messageComposeDelegate = MessageComposerDelegate()
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    VStack{
                        HStack {
                            Text("From ")
                                .foregroundColor(Color.gray)
                            Spacer()
                            TextField(fromAccount, text: $composeFrom)
                                .textContentType(.emailAddress)
                                .autocapitalization(.none)
                                .disabled(true)
                        }
                        .padding(.leading)
                        Rectangle().frame(height: 1).foregroundColor(.gray)
                    }
                    Spacer(minLength: 9)
                    
                    VStack{
                        HStack {
                            Text("To ")
                                .foregroundColor(Color.gray)
                            Spacer()
                            TextField("", text: $composeTo)
                                .textContentType(.emailAddress)
                                .autocapitalization(.none)
                        }
                        .padding(.leading)
                        Rectangle().frame(height: 1).foregroundColor(.gray)
                    }
                    Spacer(minLength: 9)
                    
                    VStack {
                        HStack {
                            Text("Cc ")
                                .foregroundColor(Color.gray)
                            Spacer()
                            TextField("", text: $composeCC)
                                .textContentType(.emailAddress)
                                .autocapitalization(.none)
                        }
                        .padding(.leading)
                        Rectangle().frame(height: 1).foregroundColor(.gray)
                    }
                    Spacer(minLength: 9)
                    
                    VStack {
                        HStack {
                            Text("Bcc ")
                                .foregroundColor(Color.gray)
                            Spacer()
                            TextField("", text: $composeBCC)
                                .textContentType(.emailAddress)
                                .autocapitalization(.none)
                        }
                        .padding(.leading)
                        Rectangle().frame(height: 1).foregroundColor(.gray)
                    }
                    Spacer(minLength: 9)
                    
                    VStack {
                        HStack {
                            Text("Subject ")
                                .foregroundColor(Color.gray)
                            Spacer()
                            TextField("", text: $composeSubject)
                        }
                        .padding(.leading)
                        Rectangle().frame(height: 1).foregroundColor(.gray)
                    }
                    Spacer(minLength: 9)
                    
                    VStack {
                        TextEditor(text: $composeBody)
                            .accessibilityLabel("composeBody")
                    }
                }
            }
            .padding()
            .navigationTitle("Compose email")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        var shortcode = ""
                        for platform in platforms {
                            shortcode = platform.shortcode!
                            break
                        }
                        let formattedEmail = formatEmailForPublishing(
                            platformLetter: shortcode,
                            to: composeTo,
                            cc: composeCC,
                            bcc: composeBCC,
                            subject: composeSubject,
                            body: composeBody)
                        
//                        let encryptedFormattedContent = formatForPublishing(formattedContent: formattedEmail)
//                        
//                        print("Encrypted formatted content: \(encryptedFormattedContent)")
//                        
//                        let gatewayClientHandler = GatewayClientHandler(gatewayClientsEntities: gatewayClientsEntities)
//                        
//                        let defaultGatewayClient: String = gatewayClientHandler.getDefaultGatewayClientMSISDN()
//                        
//                        print("Default Gateway client: " + defaultGatewayClient)
                        
                        let encryptedFormattedContent = formattedEmail
                        
                        sendSMS(message: encryptedFormattedContent,
                                receipient: "+123456789",
                                messageComposeDelegate: self.messageComposeDelegate)
                        self.dismiss()
                    }) {
                        Text("Send")
                    }
                }
        })
        }
    }
    
    func formatEmailForViewing(decryptedData: String) -> (platformLetter: String, to: String, cc: String, bcc: String, subject: String, body: String) {
        let splitString = decryptedData.components(separatedBy: ":")
        
        let platformLetter: String = splitString[0]
        let to: String = splitString[1]
        let cc: String = splitString[2]
        let bcc: String = splitString[3]
        let subject: String = splitString[4]
        let body: String = splitString[5]
        
        return (platformLetter, to, cc, bcc, subject, body)
    }

    func formatEmailForPublishing(
        platformLetter: String,
        to: String, cc: String, bcc: String, subject: String, body: String) -> String {
            
            let formattedString: String = platformLetter + ":" + to + ":" + cc + ":" + bcc + ":" + subject + ":" + body
            
            return formattedString
    }

}


struct EmailView_Preview: PreviewProvider {
    static var previews: some View {
        let container = createInMemoryPersistentContainer()
        populateMockData(container: container)
        
        return EmailView(platformName: "gmail", 
                         fromAccount: "dev@relay.sms")
            .environment(\.managedObjectContext, container.viewContext)
    }
}