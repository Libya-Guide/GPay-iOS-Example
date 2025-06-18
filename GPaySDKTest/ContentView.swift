//
//  ContentView.swift
//  GPaySDKTest
//
//  Created by Basem Elazzabi on 4/6/2025.
//

import SwiftUI
import GPay_iOS_SDK

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                let gpayView = GPayPortal(
                    // Use .production for production environment
                    sdkUrl: .staging,
                    // Replace with the actual amount you want to pay.
                    amount: 85.4,
                    // Replace with your actual username that is associaed with the API Key that you use to create the payment request
                    requesterUsername: "<your_username_here>",
                    // Replace with your actual request ID that you received when you created the payment request.
                    requestId: "2ddaeff1-3778-40a0-97ca-5e39921567e2",
                    // Replace with your actual request time that you received when you created the payment request.
                    requestTime: "1749822320301",
                    onCheckPayment: { view in
                        // Check if the payment request has been paid
                        // by calling the GPay API from your backend
                        // ....
                        
                        // To close the view. Execute this line.
                        print("Payment request has been paid, closing the view.")
                        view.close()
                    },
                    onViewClosed: { view in
                        // Use this callback to perform any action
                        // you need after the view is closed.
                        // ...
                        print("GPay view has been closed.")
                    }
                )
                gpayView.show()
                
                // If you want to close the view programmatically,
                // gpayView.close()
            }) {
                Text("Tap Me")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
