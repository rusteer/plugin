cd e:\tmp\mmvideo\
rm 1.keystore
keytool -genkey -noprompt -v -keystore 1.keystore -alias main -keyalg RSA -keysize 2048 -validity 10000 -keypass wodemima -storepass wodemima -dname "CN=xx, OU=bb, O=cc, L=dd, S=ee, C=ff"
rm -R out/build out/dist source-release.apk & apktool b out & jarsigner -verbose -storepass wodemima -keystore 1.keystore -signedjar source-release.apk out/dist/source.apk main


 