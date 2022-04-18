echo 'fetching stackmate-core'
git clone https://github.com/StackmateNetwork/stackmate-core.git

echo 'building stackmate-core for android'
echo 'this might take a while ..'
cd stackmate-core
make android

echo 'updating to new jni binaries'
mv -f ./target/aarch64-linux-android/release/libstackmate.so ../android/src/main/jniLibs/arm64-v8a
mv -f ./target/armv7-linux-androideabi/release/libstackmate.so ../android/src/main/jniLibs/armeabi-v7a
mv -f ./target/i686-linux-android/release/libstackmate.so ../android/src/main/jniLibs/x86
mv -f ./target/x86_64-linux-android/release/libstackmate.so ../android/src/main/jniLibs/x86_64


echo 'build stackmate-core for android'
echo 'this might take a while ..'
# cargo lipo --release

echo 'updating to new ios binaries'
# mv -f ./target/universal/release/libstackmate.a ../ios

echo 'cleaning up ..'
cd ..
rm -f -r stackmate-core

echo '\n\nstackmate-core for android and ios updated !\n\n'

echo '-- Add new functions to ios/Classes/BitcoinPlugin.h \n'
echo '-- Call new functions in ios/Classes/BitcoinPlugin.swift\n'
echo '-- Open XCode and link the new .a binary\n\n'

