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

        private func sendEmail() {
                let recipients = "ambiente@comunebn.it,info@asiabenevento.it"
                let subject = "Segnalazione Problema in Città"
                let body = """
                Gentile Comune,

                desidero segnalare un problema riguardante la nostra città.

                Dettagli del problema:
                (Descrivi qui il problema, includendo la posizione e qualsiasi informazione utile)

                Grazie per l'attenzione.

                Cordiali saluti. (nome, cognome)
                """

                let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

                if let url = URL(string: "mailto:\(recipients)?subject=\(encodedSubject)&body=\(encodedBody)") {
                    UIApplication.shared.open(url)
                }
            }

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
                        .font(.system(size: 26))
                        .bold(true)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        sendEmail()
                    }) {
                        HStack {
                            Text("Report").padding(
                                EdgeInsets(
                                    top: 0, leading: 8, bottom: 0, trailing: 4))
                            Image(systemName: "plus.circle")
                        }
                    }
                }

            }
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
            .navigationTitle("Communication")
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
