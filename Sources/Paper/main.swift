import CGtk3
import SwiftyJSON

// Initialize GTK
gtk_init(nil, nil)

// Create a window
let window = gtk_window_new(GTK_WINDOW_TOPLEVEL)
gtk_window_set_title(unsafeBitCast(window, to: UnsafeMutablePointer<GtkWindow>.self), "Hello Swift GTK")
gtk_window_set_default_size(unsafeBitCast(window, to: UnsafeMutablePointer<GtkWindow>.self), 400, 200)

// Show everything
gtk_widget_show_all(window)

print("GTK Window is now running!")
gtk_main()
