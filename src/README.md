# magisk_android_mdns

Have you ever suck condition when you need to ssh-ing android phone but you don't know what is the ip address. Then you need to wake up and walking to your phone just to check what's is your phone ip and get back to laptop or other devices.

This feature to get our android phone ip address could call by its hostname using feature MDNS like avahi and bonjour does.

Requirements:
- Termux app (apps below install in termux)
- Python 3.10
- Chyton
- Clang
- Make

To build the apps use make:
```
make
```
or
```
make all
```
Binary file will appear in build directory called mini_mdns
