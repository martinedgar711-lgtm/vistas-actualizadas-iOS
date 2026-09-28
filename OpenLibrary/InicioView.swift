import SwiftUI

// Vista 2: Inicio (pestaña Home seleccionada)
struct InicioView: View {
    var body: some View {
        TabsFijas(selected: 0) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Busca algún libro")
                    .font(.title.bold())

                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)
                    Text("Buscar libros")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray5), lineWidth: 1))

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
        }
    }
}

// MARK: - Apoyo (privado a este archivo)

private struct TabsFijas<Content: View>: View {
    let selected: Int
    let content: Content

    init(selected: Int, @ViewBuilder content: () -> Content) {
        self.selected = selected
        self.content = content()
    }

    private func tab(_ i: Int, _ title: String, _ icon: String) -> some View {
        Group {
            if i == selected { content } else { Color.clear }
        }
        .tabItem { Label(title, systemImage: icon) }
        .tag(i)
    }

    var body: some View {
        TabView(selection: .constant(selected)) {
            tab(0, "Home", "house")
            tab(1, "Buscar", "magnifyingglass")
            tab(2, "Mis libros", "book")
        }
    }
}

#Preview { InicioView() }
