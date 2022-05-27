#!/bin/bash -e

RELEASE=v0.8.5

rm -rf releases
mkdir -p releases
cd releases
echo "fetching stackmate-core release $RELEASE"
wget https://github.com/StackmateNetwork/stackmate-core/releases/download/$RELEASE/$RELEASE.tar.gz 
tar -xzf $RELEASE.tar.gz 
rm -rf $RELEASE.tar.gz
cd ..

echo 'updating to new jni binaries'

mkdir -p android/src/main/jniLibs/arm64-v8a
mkdir -p android/src/main/jniLibs/armeabi-v7a
mkdir -p android/src/main/jniLibs/x86
mkdir -p android/src/main/jniLibs/x86_64

mv -f releases/builds/aarch64-linux-android/libstackmate.so android/src/main/jniLibs/arm64-v8a
mv -f releases/builds/armv7-linux-androideabi/libstackmate.so android/src/main/jniLibs/armeabi-v7a
mv -f releases/builds/i686-linux-android/libstackmate.so android/src/main/jniLibs/x86
mv -f releases/builds/x86_64-linux-android/libstackmate.so android/src/main/jniLibs/x86_64

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

