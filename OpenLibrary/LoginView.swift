import SwiftUI

// Vista 1: Login "Open Library"
struct LoginView: View {
    @State private var usuario = ""

    var body: some View {
        VStack(spacing: 0) {
            Text("Open\nLibrary")
                .font(.system(size: 34, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top, 90)

            VStack(alignment: .leading, spacing: 12) {
                Text("Usuario")
                    .font(.title3)

                TextField("Insertar nombre de usuario", text: $usuario)
                    .font(.subheadline)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()

                Divider()
            }
            .padding(.top, 90)
            .padding(.horizontal, 24)

            Button {
                // Sin funcionalidad por ahora
            } label: {
                Text("Ingresar")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 28)
                    .padding(.vertical, 11)
                    .background(Color.blue, in: Capsule())
            }
            .padding(.top, 28)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
    }
}

#Preview { LoginView() }
