# C++ Debugging in VSCode and Docker

Based on instructions at: https://medium.com/@aharon.amir/develop-c-on-docker-with-vscode-98fb85b818b2

Includes modifications use `docker-machine` on macOS.

## Instructions for macOS

### Setting up `gdb`
1. Install `gdb` by running `brew install gdb`
2. Open the `Keychain Access` application. Use the Certificate Assistant Menu to create a new Certificate. 
   ![Certificate assistant](https://raw.githubusercontent.com/thomasantony/vscode-cpp-docker-debug/master/docs/cert_assistant.png)


3. Set the Name as `gdb-cert`, Identitiy Type as `Self Signed Root` and Certificate Type as `Code Signing` and click "Create".
4. In a terminal, run `codesign -s gdb.cert /usr/local/bin/gdb` to sign the `gdb` executable.

### Build and start docker environment

1. Open the project in Visual Studio Code.
2. Press `⌘ + Shift + P`, type `Run Task`, Press Enter, and then select `Build Development Image` from the dropdown.
3. Next, run the following tasks using the same propcess:
   * `Start Development Environment`
   * `Enable Port-Forwarding for Docker-Machine`
   * `Run CMake`
   * `Build`
4. Press `F5` or Select `Debug -> Start Debugging` to start line-by-line debugging. The program should pause at the entry point allowing you to step through the code. This functionality can be disabled by setting `stopAtEntry` to `false` in `.vscode/launch.json`. You may also set breakpoints in the code by clicking to the left of the line numbers in your source file. 