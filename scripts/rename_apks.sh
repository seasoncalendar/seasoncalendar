# build/app/outputs/flutter-apk/app-foss-release.apk
# build/app/outputs/flutter-apk/app-armeabi-v7a-foss-release.apk
# to
# seasoncalendar_v1-4-9_c44.apk
# seasoncalendar_v1-4-9_c44_armeabi-v7a.apk
# seasoncalendar_v1-4-9_c44_x86_64.apk
export BUILD_NUMBER=$(sed -n 's/version: \([^+]\+\)+\([0-9]\+\)/\2/p' pubspec.yaml)
export BUILD_VERSION=$(sed -n 's/version: \([^+]\+\)+\([0-9]\+\)/\1/p' pubspec.yaml)
export BUILD_NAME=${BUILD_VERSION//[.]/-}

f=build/app/outputs/flutter-apk/app-foss-release.apk
name=build/app/outputs/flutter-apk/seasoncalendar_v${BUILD_NAME}_c${BUILD_NUMBER}.apk

mv $f $name

for f in build/app/outputs/flutter-apk/app*release.apk; do
    name=$(sed -e "s/-foss-release//" <<< $f | \
           sed -e "s/app-/app/" | \
           sed -e "s/app-\?/seasoncalendar_v${BUILD_NAME}_c${BUILD_NUMBER}_/2"\
        )
    mv $f $name
done
