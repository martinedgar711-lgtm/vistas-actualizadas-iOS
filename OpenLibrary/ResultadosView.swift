import SwiftUI

// Vista 4: Resultados de búsqueda
struct ResultadosView: View {
    var body: some View {
        TabsFijas(selected: 1) {
            VStack(alignment: .leading, spacing: 0) {

                HStack(spacing: 12) {
                    Image(systemName: "arrow.left")
                        .font(.title3.weight(.semibold))

                    Text("Gabriel García Márquez")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                        .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 12)

                Divider()

                Text("Resultados encontrados")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 16)
                    .padding(.top, 14)
                    .padding(.bottom, 10)

                HStack(spacing: 14) {
                    PortadaRelleno(width: 56, height: 56)

                    VStack(alignment: .leading, spacing: 3) {
                        Text("Cien años de soledad")
                            .font(.subheadline.weight(.bold))
                        Text("Gabriel García Márquez")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Text("1967 •")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                    }
                    Spacer(minLength: 0)
                }
                .padding(12)
                .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal, 16)

                Spacer()
            }
            .padding(.top, 8)
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

private struct PortadaRelleno: View {
    var width: CGFloat
    var height: CGFloat
    var circle: CGFloat = 30

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(.secondarySystemBackground))

            GeometryReader { g in
                Path { p in
                    let w = g.size.width, h = g.size.height
                    let c = CGPoint(x: w / 2, y: h / 2)
                    for corner in [CGPoint(x: 0, y: 0), CGPoint(x: w, y: 0),
                                   CGPoint(x: 0, y: h), CGPoint(x: w, y: h)] {
                        p.move(to: corner)
                        p.addLine(to: c)
                    }
                }
                .stroke(Color(.systemGray5), lineWidth: 0.8)
            }

            RoundedRectangle(cornerRadius: 4)
                .strokeBorder(style: StrokeStyle(lineWidth: 0.8, dash: [3]))
                .foregroundStyle(Color(.systemGray3))

            Circle()
                .fill(Color(.systemBackground))
                .frame(width: circle, height: circle)
            Image(systemName: "book.closed")
                .font(.system(size: circle * 0.42))
                .foregroundStyle(.secondary)
        }
        .frame(width: width, height: height)
    }
}

#Preview { ResultadosView() }
