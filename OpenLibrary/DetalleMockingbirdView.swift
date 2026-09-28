import SwiftUI

// Vista 5: Detalles de "To Kill a Mockingbird" (botón Guardarlo en mis libros)
struct DetalleMockingbirdView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text("Detalles")
                    .font(.subheadline.weight(.bold))
                HStack {
                    Image(systemName: "arrow.left")
                        .font(.title3.weight(.semibold))
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)

            PortadaRelleno(width: 130, height: 180, circle: 34)
                .padding(.top, 22)

            Text("To Kill a Mockingbird")
                .font(.title3.bold())
                .padding(.top, 18)
            Text("Harper Lee")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding(.top, 4)

            HStack {
                dato("Páginas", "324")
                dato("Idioma", "Inglés")
                dato("Año de publicación", "1960")
            }
            .padding(.vertical, 8)
            .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray5), lineWidth: 1))
            .padding(.horizontal, 20)
            .padding(.top, 18)

            VStack(alignment: .leading, spacing: 4) {
                Text("Sinopsis")
                    .font(.subheadline.weight(.bold))
                Text("Descripción...")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.top, 18)

                HStack(spacing: 8) {
                    Image(systemName: "bookmark")
                    Text("Guardarlo en mis libros")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 13)
                .background(Color(red: 0.22, green: 0.25, blue: 0.32), in: RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 20)
                .padding(.top, 16)

            Spacer()
        }
        .background(Color(.systemBackground))
    }

    private func dato(_ etiqueta: String, _ valor: String) -> some View {
        VStack(spacing: 3) {
            Text(etiqueta)
                .font(.system(size: 10))
                .foregroundStyle(.secondary)
            Text(valor)
                .font(.footnote.weight(.bold))
        }
        .frame(maxWidth: .infinity)
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

#Preview { DetalleMockingbirdView() }
