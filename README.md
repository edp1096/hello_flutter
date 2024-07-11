# hello_flutter

Source: https://100sucoding.tistory.com/20?category=945334


* 라우트 - https://mugon-devlog.tistory.com/m/71
* 웹뷰
    * https://pub.dev/packages/webview_flutter
    * 이전
        * https://dev-yakuza.posstree.com/ko/flutter/webview_flutter
        * https://endless-learn-code.tistory.com/11

* Gomobile 설치 - https://github.com/golang/go/wiki/Mobile

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

* android/build.gradle
    * https://stackoverflow.com/a/65114198/8964990
    * https://github.com/kateile/android-app-with-golang/blob/main/client/app/build.gradle

* kt
    * https://github.com/kateile/android-app-with-golang/blob/main/client/app/src/main/java/com/kateile/futa/FirstFragment.kt
