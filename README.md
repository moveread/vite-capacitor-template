# Vite Capacitor Template

> Vite x Capacitor x React x Typescript. For Android.

- Works from WSL and Powershell

## Pre-requisites

> Refer to the [Capacitor Documentation](https://capacitorjs.com/docs/getting-started/environment-setup#core-requirements)

TL; DR: you need this on Windows:

- Android SDK (easy to install from Android Studio, though you may have to set up `env:$ANDROID_HOME` and add Android SDK stuff to `env:$PATH` manually)
- `adb` (easily installed via Android Studio)

You don't need anything on WSL as android-specific commands will actually run on PowerShell.

- Enable `Developer Options` on your phone, with `Wireless debugging`. Refer to the [google docs](https://developer.android.com/tools/adb#wireless-android11-command-line)

## Usage

1. Install [`just`](https://github.com/casey/just?tab=readme-ov-file) (if not done yet - see details below)
2. Pair your phone to `adb` (if not done yet - details below)
3. Run `just`

### Installing `just`
- The simplest options are 
  - `cargo install just`, or
  - `yarn add --dev just-install` (but then you'll have to use `npx just` instead of `just`)
- For more options, read the [installation instructions](https://cheatography.com/linux-china/cheat-sheets/justfile/)
- For a quick overview, you can read this [cheatsheet](https://cheatography.com/linux-china/cheat-sheets/justfile/)

### Pairing phone to `adb`

On your phone, open `Developer Options`, `Wireless debugging`, `Pair device with pairing code` and copy `IP address & Port`. Run:

  ```
  just pair 192.168.1.133:40613 # the pairing IP address & Port:
  ```

  and enter the `Wi-Fi pairing code`

  After some seconds (say, 5 to 15), you should see something like:

  ```bash
  Successfully paired to 192.168.1.133:40613 [guid=adb-ac5asfad2-jag54t]
  ```

  If it fails, you can try `just restart` and then retry. Good luck! ;)

## Notes

- Reading the [CapacitorJS docs](https://capacitorjs.com/docs/getting-started) would do you no harm. Short and sweet and help you understand all of this
- **If you change settings** after `just init`, run `npx cap sync` before proceeding
- To start when the android app is already build:
    ```bash
    just android
    ```

## Configuration (.env)
These settings are created when running `just` / `just init` / `just config`, or you can edit them manually:
- `APP_NAME`: Android app name
- `APP_ID`: e.g `com.mydomain.app`
- `PC_LAN_IP` e.g. `192.168.1.x`
- `PHONE_URL` (continue reading for details)
- `PORT` defaults to `5173`


## Vite README
### React + TypeScript + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh

### Expanding the ESLint configuration

If you are developing a production application, we recommend updating the configuration to enable type aware lint rules:

- Configure the top-level `parserOptions` property like this:

```js
export default {
  // other rules...
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
    project: ['./tsconfig.json', './tsconfig.node.json'],
    tsconfigRootDir: __dirname,
  },
}
```

- Replace `plugin:@typescript-eslint/recommended` to `plugin:@typescript-eslint/recommended-type-checked` or `plugin:@typescript-eslint/strict-type-checked`
- Optionally add `plugin:@typescript-eslint/stylistic-type-checked`
- Install [eslint-plugin-react](https://github.com/jsx-eslint/eslint-plugin-react) and add `plugin:react/recommended` & `plugin:react/jsx-runtime` to the `extends` list
