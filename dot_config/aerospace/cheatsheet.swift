import AppKit
import WebKit

class Overlay: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let screen = NSScreen.main!.visibleFrame
        let w: CGFloat = screen.width * 0.80
        let h: CGFloat = screen.height * 0.80
        let x = screen.origin.x + (screen.width - w) / 2
        let y = screen.origin.y + (screen.height - h) / 2

        window = NSWindow(
            contentRect: NSRect(x: x, y: y, width: w, height: h),
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )
        window.level = .floating
        window.backgroundColor = .clear
        window.isOpaque = false
        window.hasShadow = true
        window.isMovableByWindowBackground = true

        let visual = NSVisualEffectView(frame: NSRect(x: 0, y: 0, width: w, height: h))
        visual.material = .underWindowBackground
        visual.blendingMode = .behindWindow
        visual.state = .active
        visual.wantsLayer = true
        visual.layer?.cornerRadius = 20
        visual.layer?.masksToBounds = true
        window.alphaValue = 0.92
        window.contentView = visual

        let webView = WKWebView(frame: visual.bounds)
        webView.autoresizingMask = [.width, .height]
        webView.setValue(false, forKey: "drawsBackground")

        let htmlPath = (("~/.config/aerospace/cheatsheet.html" as NSString).expandingTildeInPath)
        let url = URL(fileURLWithPath: htmlPath)
        webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        visual.addSubview(webView)

        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)

        // Escape to close
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
            if event.keyCode == 53 {
                NSApp.terminate(nil)
                return nil
            }
            return event
        }

        // Click outside to close
        NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseDown, .rightMouseDown]) { _ in
            NSApp.terminate(nil)
        }
    }
}

let app = NSApplication.shared
app.setActivationPolicy(.accessory)
let delegate = Overlay()
app.delegate = delegate
app.run()
