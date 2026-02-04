/* File: Client.m */
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import "Person.h"
#import "Titling.h"
 
int main() {
    @autoreleasepool {
        // Open the library.
        void* lib_handle = dlopen("./libPerson.dylib", RTLD_LOCAL);
        if (!lib_handle) {
            NSLog(@"[%s] main: Unable to open library: %s\n",
            __FILE__, dlerror());
            exit(EXIT_FAILURE);
        }
 
        // Get the Person class (required with runtime-loaded libraries).
        Class Person_class = objc_getClass("Person");
        if (!Person_class) {
            NSLog(@"[%s] main: Unable to get Person class", __FILE__);
            exit(EXIT_FAILURE);
        }
 
        // Create an instance of Person.
        NSLog(@"[%s] main: Instantiating Person_class", __FILE__);
        NSObject<Person,Titling>* person = [Person_class new];
 
        // Use person.
        [person setName:@"Perrine LeVan"];
        [person setTitle:@"Ms."];
        NSLog(@"[%s] main: [person name] = %@", __FILE__, [person name]);
 
        // Close the library.
        if (dlclose(lib_handle) != 0) {
            NSLog(@"[%s] Unable to close library: %s\n",
                __FILE__, dlerror());
            exit(EXIT_FAILURE);
        }
 
    }
    return(EXIT_SUCCESS);
}
