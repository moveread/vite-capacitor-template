set dotenv-load := true

# Initialize android project
init:
  yarn run build
  npx cap sync
  [ -d android ] && rm -dr android || :
  npx cap add android
  just android-build
  just android


# Shortcut for yarn dev --host
dev PORT="$PORT":
  yarn dev --host --port {{PORT}}

build:
  yarn run build

preview:
  yarn preview --host

# Build android app, connect to phone and install app there
android: connect install run

# Build android appp
android-build:
  cd android && ./gradlew syncDebugLibJars
  cd android && ./gradlew assembleDebug

# Pair phone (see https://developer.android.com/tools/adb#wireless-android11-command-line for details)
pair PAIR_URL:
  powershell.exe adb pair {{PAIR_URL}}

# Restart adb server
restart:
  powershell.exe adb kill-server
  powershell.exe adb start-server

# Connect to phone
connect PHONE_URL="$PHONE_URL":
  powershell.exe adb connect {{PHONE_URL}}

# Install app on phone (must be connected first)
install PHONE_URL="$PHONE_URL":
  powershell.exe adb -s {{PHONE_URL}} install android/app/build/outputs/apk/debug/app-debug.apk

# Run app on phone (must be installed first)
run PHONE_URL="$PHONE_URL" APP="$APP_ID":
  powershell.exe adb -s {{PHONE_URL}} shell cmd activity start-activity {{APP}}/.MainActivity
  just dev


