//
//  ContentView.swift
//  68.Pr14.BucketList
//
//  Created by Валентин on 28.08.2025.
//

import LocalAuthentication
import SwiftUI

struct ContentView: View {
   @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if  isUnlocked {
                Text("Unlocked")
            } else{
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We neen to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true   //успешная аутентификация
                } else {
                    //ошибка аутентификации
                }
            }
        } else {
            // на данном устройстве отсутствует возможность аутентификации по биометрии
        }
    }
}

#Preview {
    ContentView()
}
