# hello_flutter

Source: https://100sucoding.tistory.com/20?category=945334


* 라우트 - https://mugon-devlog.tistory.com/m/71
* 웹뷰
    * https://pub.dev/packages/webview_flutter
    * 이전
        * https://dev-yakuza.posstree.com/ko/flutter/webview_flutter
        * https://endless-learn-code.tistory.com/11


## Golang

* Gomobile 설치 - https://go.dev/wiki/Mobile

* Web용 실행파일 생성
```powershell
cd go_server
go build -ldflags="-H windowsgui -w -s" ./cmd
# Browser -> http://localhost:12480/hello
```

* aar 생성
```powershell
# MY - $env:path+=";D:\dev\my-flutter-set\openjdk\bin"
cd go_server
gomobile init
gomobile bind -v -o ../flutter_client/android/app/libs/server.aar -target=android .
```

* dll 생성
```powershell
cd go_server
go build -buildmode=c-shared -o ../flutter_client/windows/libserver.dll ./dll
dlltool --dllname ../flutter_client/windows/libserver.dll --output-lib ../flutter_client/windows/libserver.a
```


## Flutter

* flutter 빌드 - windows
```powershell
cd flutter_client
# flutter run -d windows
flutter build windows
```

* flutter 빌드 - android
```powershell
cd flutter_client
flutter build apk --release --target-platform=android-arm64
```

* android/build.gradle
    * https://stackoverflow.com/a/65114198/8964990
    * https://github.com/kateile/android-app-with-golang/blob/main/client/app/build.gradle

* kt
    * https://github.com/kateile/android-app-with-golang/blob/main/client/app/src/main/java/com/kateile/futa/FirstFragment.kt


## 아이콘
    * 이미지
        * https://www.flaticon.com/free-icon/dummy_5808188
        * https://www.flaticon.com/free-icon/money_1756530
        * https://www.flaticon.com/free-icon/money_617099
    * 생성기
        * https://www.appicon.co
        * https://www.png2ico.com
        * https://www.iloveimg.com/resize-image/resize-png
