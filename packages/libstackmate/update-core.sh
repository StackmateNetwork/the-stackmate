#!/bin/bash -e

RELEASE=v0.12.2

rm -rf releases
mkdir -p releases
cd releases
printf "Fetching stackmate-core release $RELEASE\n ..."
wget https://github.com/StackmateNetwork/stackmate-core/releases/download/$RELEASE/$RELEASE.tar.gz
tar -xzf $RELEASE.tar.gz 
rm -rf $RELEASE.tar.gz
cd ..



printf "Updating Binaries ...\n"

mkdir -p android/src/main/jniLibs/arm64-v8a
mkdir -p android/src/main/jniLibs/armeabi-v7a
mkdir -p android/src/main/jniLibs/x86
mkdir -p android/src/main/jniLibs/x86_64
mkdir -p linux/x86_64
mkdir -p macos/x86_64


mv -f releases/builds/aarch64-linux-android/libstackmate.so android/src/main/jniLibs/arm64-v8a
mv -f releases/builds/armv7-linux-androideabi/libstackmate.so android/src/main/jniLibs/armeabi-v7a
mv -f releases/builds/i686-linux-android/libstackmate.so android/src/main/jniLibs/x86
mv -f releases/builds/x86_64-linux-android/libstackmate.so android/src/main/jniLibs/x86_64
mv -f releases/builds/x86_64-linux-unknown/libstackmate.so linux/x86_64
mv -f releases/builds/x86_64-apple-darwin/libstackmate.dylib macos/x86_64

echo "Cleaning Up."

rm -rf releases

# echo 'build stackmate-core for android'
# echo 'this might take a while ..'
# # cargo lipo --release

# echo 'updating to new ios binaries'
# # mv -f ./target/universal/libstackmate.a ../ios

# echo 'cleaning up ..'
# cd ..
# rm -f -r stackmate-core

# echo '\n\nstackmate-core for android and ios updated !\n\n'

# echo '-- Add new functions to ios/Classes/BitcoinPlugin.h \n'
# echo '-- Call new functions in ios/Classes/BitcoinPlugin.swift\n'
# echo '-- Open XCode and link the new .a binary\n\n'

