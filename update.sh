#!/bin/bash

# Remove old files
echo "Removing Old Files..."
sudo rm -rf /bin/burpsuitepro

# Installing Dependencies
echo "Installing Dependencies..."
sudo pacman -Sy
sudo pacman -S git axel jre21-openjdk --noconfirm

# Cloning
git clone https://github.com/xiv3r/Burpsuite-Professional.git 
mv Burpsuite-Professional Burpsuite-Professional-Arch
cd Burpsuite-Professional-Arch
rm flake.* *.psi default.* *macos

# Download Burpsuite Professional
echo "Downloading Burp Suite Professional Latest..."
version=2025.5.6
url="https://portswigger.net/burp/releases/download?product=pro&type=Jar"
axel "$url" -o "burpsuite_pro_v$version.jar"

# Execute Key Generator and Burp Suite Simultaneously
echo "Starting Key loader.jar..."
(java -jar loader.jar) &

# Execute Burpsuite Professional
echo "Executing Burpsuite Professional..."
echo "java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/burpsuite_pro_v$version.jar &" > burpsuitepro
chmod +x burpsuitepro
cp burpsuitepro /bin/burpsuitepro
(./burpsuitepro)
