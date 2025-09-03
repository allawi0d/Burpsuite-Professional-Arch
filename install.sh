#!/bin/bash

# Installing Dependencies
echo "Installing Dependencies..."
sudo pacman -Sy
sudo pacman -S git axel jre21-openjdk -y

# Cloning
git clone https://github.com/allawi0d/Burpsuite-Professional-Arch.git 
cd Burpsuite-Professional-Arch

# Download Burpsuite Professional
echo "Downloading Burp Suite Professional Latest..."
version=2025
url="https://portswigger.net/burp/releases/download?product=pro&type=Jar"
axel "$url" -o "burpsuite_pro_v$version.jar"

# Execute Key Generator
echo "Starting Key loader.jar..."
(java -jar loader.jar) &

# Execute Burpsuite Professional
echo "Executing Burpsuite Professional..."
echo "java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/burpsuite_pro_v$version.jar &" > burpsuitepro
chmod +x burpsuitepro
cp burpsuitepro /bin/burpsuitepro
(./burpsuitepro)
