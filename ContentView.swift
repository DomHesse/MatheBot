import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Willkommen, mein Name ist Dominik. Vielen Dank für die Teilnahme am Einstufungstest im Bereich Analysis speziell Kurvendiskussion. Im Folgenden werden dir nun zehn Fragen gestellt. Bitte beantworte die Fragen einmalig wie folgt: Fragenr) Deine Antwort . Lass und direkt loslegen ...", "1) Die Ableitung einer Funktion ist eine ...", "2) Die Ableitung einer quadratischen Funktion ist eine ...", "3) Wie untersucht man eine Funktion f(x) hinsichtlich ihrer Nullstellen?", "4) Die Ableitung einer Funktion (x^2 - 3)^2 ist gegeben durch ...", "5) Wie nennt man die rechnerische Untersuchung von Funktionen bzw. deren Graphen?", "6) Ist diese Funktion symmetrisch? f(x) = x^6", "7) Wofür ist dies ein Kriterium? f´(x) > 0", "8) Die Funktion f(x) = 2x^2 ist ...", "9) Die Ableitung hängt eng mit dem folgenden Begriff zusammen ...", "10) Wofür ist dies ein Kriterium? f`(x) = 0 und f``(x) > 0"]
    
    var body: some View {
        VStack {
            HStack{
                Text("MatheBot")
                    .font(.largeTitle)
                    .bold()
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color.green)
                }
            ScrollView{
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack{
                            Spacer()
                                Text(newMessage)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.green.opacity(0.8))
                                    .cornerRadius(10)
                                    .padding(.bottom, 10)
                        }
                    } 
                    else {
                        HStack{
                            Text(message)
                                .padding()
                                .background(.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                } .rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.10))
            
            HStack{
                TextField("Bitte gebe etwas ein", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button{
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
            }
            .padding()
        }
    }
    
    func sendMessage(message: String) {
        withAnimation{
            messages.append("[USER]" + message)
            self.messageText = "" 
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                messages.append(getBotResponse(message: message))
            }
        }
    }
}
