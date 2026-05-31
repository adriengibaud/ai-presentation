import Cocoa

// 16:9 at high res
let w = 2560, h = 1440
let cs = CGColorSpaceCreateDeviceRGB()
guard let ctx = CGContext(data: nil, width: w, height: h, bitsPerComponent: 8,
                          bytesPerRow: 0, space: cs,
                          bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
    exit(1)
}

// Dark near-black with a subtle drift toward purple.
// Top-left: very dark blue-black. Bottom-right: deep purple.
let colors = [
    CGColor(red: 0.043, green: 0.039, blue: 0.071, alpha: 1.0),  // #0B0A12 near-black
    CGColor(red: 0.094, green: 0.063, blue: 0.157, alpha: 1.0),  // #181028 dark purple
    CGColor(red: 0.180, green: 0.094, blue: 0.290, alpha: 1.0)   // #2E184A deeper purple glow
] as CFArray
let locations: [CGFloat] = [0.0, 0.6, 1.0]
guard let grad = CGGradient(colorsSpace: cs, colors: colors, locations: locations) else { exit(1) }

// Diagonal from top-left (dark) to bottom-right (purple)
ctx.drawLinearGradient(grad,
                       start: CGPoint(x: 0, y: h),
                       end: CGPoint(x: w, y: 0),
                       options: [])

guard let img = ctx.makeImage() else { exit(1) }
let rep = NSBitmapImageRep(cgImage: img)
guard let png = rep.representation(using: .png, properties: [:]) else { exit(1) }
let out = "/Users/adriengibaud/dev/presentation/poc/bg-dark-purple.png"
try? png.write(to: URL(fileURLWithPath: out))
print("wrote \(out)")
