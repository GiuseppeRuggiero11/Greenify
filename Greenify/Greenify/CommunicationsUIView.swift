import SwiftUI

struct CommunicationsUIView: View {
    var body: some View {
        NavigationStack {
            NotificationListView()
        }
    }

    struct NotificationListView: View {
        @State private var notifications: [Notification] = [
            Notification(
                title: "Comune di Benevento",
                description: "Aggiornamento mappa Ecopunti..", date: Date()),
            Notification(
                title: "Raccolta RAEE",
                description: "Il servizio sarà attivo...",
                date: Date().addingTimeInterval(-86400)),
            Notification(
                title: "Notifica senza titolo",
                description: "Dettagli mancanti",
                date: Date().addingTimeInterval(-172800)),
        ]

        @State private var showingAddNotificationView = false  // Per il bottone "+"

        var body: some View {
            List {
                ForEach(notifications) { notification in
                    NavigationLink(
                        destination: NotificationDetailView(
                            notification: notification)
                    ) {
                        NotificationRowView(notification: notification)
                    }
                }
                .onDelete { indexSet in
                    notifications.remove(atOffsets: indexSet)
                }
            }

            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Communications")
                        .font(.system(size: 22))
                        // .bold(true)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Report Waste") {
                        showingAddNotificationView.toggle()  // Mostra la vista per aggiungere una notifica
                    }
                }

            }.sheet(isPresented: $showingAddNotificationView) {
                AddNotificationView(notifications: $notifications)  // Aggiungi una vista di inserimento notifica
            }
        }
    }

    struct AddNotificationView: View {
        @Binding var notifications: [Notification]
        @State private var title = ""
        @State private var description = ""
        @State private var recipient = ""  // Destinatario
        @State private var subject = ""  // Oggetto
        @State private var bodyText = ""  // Corpo del messaggio

        var body: some View {

            Form {
                Section(header: Text("Email Style Report Waste")) {
                    TextField("Recipient", text: $recipient)  // Destinatario
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 5)

                    TextField("Subject", text: $subject)  // Oggetto
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 5)

                    TextEditor(text: $bodyText)  // Corpo del messaggio
                        .frame(height: 200)
                        .border(Color.white, width: 1)
                        .padding(.bottom, 5)

                    Button("Send Report") {
                        sendEmail()  // Funzione per inviare l'email
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top)
                }

                .navigationTitle("Report Waste")
                .padding()
            }
        }

        private func sendEmail() {
            // Crea il link "mailto:"
            guard
                let encodedSubject = subject.addingPercentEncoding(
                    withAllowedCharacters: .urlQueryAllowed),
                let encodedBodyText = bodyText.addingPercentEncoding(
                    withAllowedCharacters: .urlQueryAllowed),
                let encodedRecipient = recipient.addingPercentEncoding(
                    withAllowedCharacters: .urlQueryAllowed)
            else {
                return
            }

            let mailtoURLString =
                "mailto:foo@example.com?cc=bar@example.com&subject=Greetings%20from%20Cupertino!&body=Wish%20you%20were%20here!"

            if let mailtoURL = URL(string: mailtoURLString) {
                if UIApplication.shared.canOpenURL(mailtoURL) {
                    UIApplication.shared.open(mailtoURL)
                } else {
                    print("Errore: l'app Mail non è disponibile.")
                }
            }

            // Aggiungi la notifica alla lista
            let newNotification = Notification(
                title: subject, description: bodyText, date: Date())
            notifications.append(newNotification)

            // Resetta i campi dopo l'invio
            title = ""
            description = ""
            recipient = ""
            subject = ""
            bodyText = ""
        }
    }

    struct NotificationRowView: View {
        private let notification: Notification

        init(notification: Notification) {
            self.notification = notification
        }

        var body: some View {
            HStack {
                Image(systemName: "bell")
                    .foregroundStyle(.blue)
                VStack(alignment: .leading) {
                    Text(notification.title)
                        .font(.headline)
                    Text(notification.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Text(notification.formattedDate)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }

    struct NotificationDetailView: View {
        var notification: Notification
        @Environment(\.presentationMode) var presentationMode  // Per il pulsante "Back"

        var body: some View {
            VStack {
                Image(systemName: "bell")
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.blue)
                Text(notification.title)
                    .font(.title)
                    .padding(.top)
                Text(notification.description)
                    .font(.body)
                    .padding(.top)
                Text("Data: \(notification.formattedDate)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top)
            }
            .padding()
            .navigationTitle("Communication of")
        }
    }

    struct Notification: Identifiable {
        var id = UUID()
        let title: String
        let description: String
        let date: Date

        var formattedDate: String {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
    }
}
#Preview {
    CommunicationsUIView()
}
