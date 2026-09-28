import SwiftUI

// Vista 7: Mis libros
struct MisLibrosView: View {
    private let libros: [(titulo: String, autor: String)] = [
        ("To Kill a Mockingbird", "Harper Lee"),
        ("The Great Gatsby", "F. Scott Fitzgerald"),
        ("1984", "George Orwell")
    ]

    var body: some View {
        TabsFijas(selected: 2) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Mis libros")
                    .font(.title.bold())
                    .padding(.horizontal, 20)
                    .padding(.top, 12)

                VStack(spacing: 12) {
                    ForEach(libros, id: \.titulo) { libro in
                        HStack(alignment: .top, spacing: 12) {
                            PortadaRelleno(width: 54, height: 60, circle: 24)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(libro.titulo)
                                    .font(.footnote.weight(.bold))
                                Text(libro.autor)
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.top, 4)
                            Spacer(minLength: 0)
                        }
                        .padding(8)
                        .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(.systemGray5), lineWidth: 1))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 40)

                Spacer()
            }
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

#Preview { MisLibrosView() }
