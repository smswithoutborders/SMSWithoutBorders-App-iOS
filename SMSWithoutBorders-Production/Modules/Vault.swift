//
//  Vault.swift
//  SMSWithoutBorders-Production
//
//  Created by sh3rlock on 24/06/2024.
//

import Foundation
import GRPC
import Logging


class Vault {
    
    enum Exceptions: Error {
        case requestNotOK(status: GRPCStatus)
    }
    
    var channel: ClientConnection?
    var callOptions: CallOptions?
    var vaultEntityStub: Vault_V1_EntityNIOClient?

    init() {
        channel = GRPCHandler.getChannelVault()
        let logger = Logger(label: "gRPC", factory: StreamLogHandler.standardOutput(label:))
        callOptions = CallOptions.init(logger: logger)
        vaultEntityStub = Vault_V1_EntityNIOClient.init(channel: channel!,
                                                            defaultCallOptions: callOptions!)
    }
    
    func createEntity(phoneNumber: String) throws -> Vault_V1_CreateEntityResponse {
        let entityCreationRequest: Vault_V1_CreateEntityRequest = .with {
            $0.phoneNumber = phoneNumber
        }
        
        let call = vaultEntityStub!.createEntity(entityCreationRequest)
        let response: Vault_V1_CreateEntityResponse
        
        do {
            response = try call.response.wait()
            let status = try call.status.wait()
            
            print("status code - raw value: \(status.code.rawValue)")
            print("status code - description: \(status.code.description)")
            print("status code - isOk: \(status.isOk)")
            
            if(!status.isOk) {
                throw Exceptions.requestNotOK(status: status)
            }
        } catch {
            print("Some error came back: \(error)")
            throw error
        }

        return response
    }
    
    func createEntity2(phoneNumber: String, 
                       countryCode: String, 
                       password: String, 
                       clientPublishPubKey: String,
                       clientDeviceIdPubKey: String,
                       ownershipResponse: String) throws -> Vault_V1_CreateEntityResponse {
        let entityCreationRequest: Vault_V1_CreateEntityRequest = .with {
            $0.countryCode = countryCode
            $0.phoneNumber = phoneNumber
            $0.password = password
            $0.clientPublishPubKey = clientPublishPubKey
            $0.clientDeviceIDPubKey = clientDeviceIdPubKey
            $0.ownershipProofResponse = ownershipResponse
        }
        
        let call = vaultEntityStub!.createEntity(entityCreationRequest)
        let response: Vault_V1_CreateEntityResponse

        do {
            response = try call.response.wait()
            let status = try call.status.wait()
            
            print("status code - raw value: \(status.code.rawValue)")
            print("status code - description: \(status.code.description)")
            print("status code - isOk: \(status.isOk)")
            
            if(!status.isOk) {
                throw Exceptions.requestNotOK(status: status)
            }
        } catch {
            print("Some error came back: \(error)")
            throw error
        }
        return response
    }
    
    func authenticateEntity(phoneNumber: String, password: String) throws -> Vault_V1_AuthenticateEntityResponse {
        let authenticateEntityRequest: Vault_V1_AuthenticateEntityRequest = .with {
            $0.phoneNumber = phoneNumber
            $0.password = password
        }
        
        let call = vaultEntityStub!.authenticateEntity(authenticateEntityRequest)
        let response: Vault_V1_AuthenticateEntityResponse
        do {
            response = try call.response.wait()
            let status = try call.status.wait()
            
            print("status code - raw value: \(status.code.rawValue)")
            print("status code - description: \(status.code.description)")
            print("status code - isOk: \(status.isOk)")
            
            if(!status.isOk) {
                throw Exceptions.requestNotOK(status: status)
            }
        } catch {
            print("Some error came back: \(error)")
            throw error
        }
        return response
    }
    
    func authenticateEntity2(phoneNumber: String, 
                             clientPublishPubKey: String,
                             clientDeviceIDPubKey: String,
                             ownershipResponse: String)
    throws -> Vault_V1_AuthenticateEntityResponse {
        let authenticateEntityRequest: Vault_V1_AuthenticateEntityRequest = .with {
            $0.phoneNumber = phoneNumber
            $0.clientPublishPubKey = clientPublishPubKey
            $0.clientDeviceIDPubKey = clientDeviceIDPubKey
            $0.ownershipProofResponse = ownershipResponse
        }
        
        let call = vaultEntityStub!.authenticateEntity(authenticateEntityRequest)
        let response: Vault_V1_AuthenticateEntityResponse
        do {
            response = try call.response.wait()
            let status = try call.status.wait()
            
            print("status code - raw value: \(status.code.rawValue)")
            print("status code - description: \(status.code.description)")
            print("status code - isOk: \(status.isOk)")
            
            if(!status.isOk) {
                throw Exceptions.requestNotOK(status: status)
            }
        } catch {
            print("Some error came back: \(error)")
            throw error
        }
        return response
    }
    
    func listStoredEntityToken(longLiveToken: String) throws -> Vault_V1_ListEntityStoredTokenResponse {
        let listEntityRequest: Vault_V1_ListEntityStoredTokenRequest = .with {
            $0.longLivedToken = longLiveToken
        }
        
        let call = vaultEntityStub!.listEntityStoredTokens(listEntityRequest)
        let response: Vault_V1_ListEntityStoredTokenResponse
        do {
            response = try call.response.wait()
            let status = try call.status.wait()
            
            print("status code - raw value: \(status.code.rawValue)")
            print("status code - description: \(status.code.description)")
            print("status code - isOk: \(status.isOk)")
            
            if(!status.isOk) {
                throw Exceptions.requestNotOK(status: status)
            }
        } catch {
            print("Some error came back: \(error)")
            throw error
        }
        return response
    }
}
