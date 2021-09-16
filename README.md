# Shareclipext

Shareclipext shares your clipboard across multiple devices. Copy on your phone and paste on your desktop!

## Quickstart

Requires [node.js](https://nodejs.org/en/) to be installed.
Run:

```
npx shareclipext
```

## Installation

Run
```
npm install -g shareclipext
```

And then
```
shareclipext
```

## Usage

After running `shareclipext`, you should see something like:

```
RUNNING AS SERVER
WARNING: THE PANDAS ARE COMING
Listening on port 54979
Run "shareclip http://192.168.29.128:54979" on a different device
```

> **WARNING: THE PANDAS ARE COMING**

Run the command provided (Here, it's `shareclipext http://192.168.29.128:54979`) on another device where you have shareclipext installed and enter. Your clipboard should be shared automatically between your devices now. Note that your devices must be under the same WiFi network.

## Specific instructions for Android

- [Download termux](https://play.google.com/store/apps/details?id=com.termux)
- Run   
```
apt update -y && apt install termux-api nodejs -y
```

- Follow instructions under **Quickstart** or **Installation**