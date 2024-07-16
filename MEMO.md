# 패키지명(application id) 바꾸기

* 리네임 패키지 설치 및 실행
```sh
cd flutter_client
flutter pub add global change_app_package_name
rename setBundleId -t android -v com.dream_world.hello_flutter
```



# 안드로이드 앱 서명

## 작업 경로
```sh
cd flutter_client
cd android
```


## KeyStore(key.jks) 생성

* 구글플레이콘솔에서 아래 두개 다운로드
    * 암호화 공개 키
    * PEPK 도구 - 

* jks 생성
```sh
keytool -genkey -v -keystore ./key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
# storePassword = password
# keyPassword = password
# keyAlias = key
# ...
```

* private key 암호화 및 export
```sh
java -jar ./pepk.jar --keystore=key.jks --alias=key --output=jks_cert.zip --include-cert --rsa-aes-encryption --encryption-key-path=encryption_public_key.pem
```

## 앱으로부터 Keystore 참조하기

* `android/app/key.properties` 파일 생성
    * jks 상대경로 위치 - `android/key.jks`

```keystore
storePassword=<password>
keyPassword=<password>
keyAlias=key
storeFile=../key.jks
```


## gradle 서명 구성

* `android/app/build.gradle` 서명 추가
    * `android { ... }` 바로 위에 아래 코드를 추가
```gradle
   def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('app/key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }

   android { ...
```

    * buildTypes 블럭을 아래 내용으로 교체 - debug > release
```gradle
   signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile file(keystoreProperties['storeFile'])
           storePassword keystoreProperties['storePassword']
       }
   }

   buildTypes {
       release {
           // signingConfig signingConfigs.debug
           signingConfig signingConfigs.release
       }
   }
```


## 플레이콘솔 작업 - 빌드 구성 검토

공식 문서에서 시키는 검토 항목

* defaultConfig (`android/app/build.gradle`) - https://noogoonaa.tistory.com/70
    * applicationId - 고유해야 하며, 배포시 변경 불가
    * minSdkVersion, targetSdkVersion
    * versionCode, versionName


## appbundle 빌드

```sh
flutter build appbundle
# /build/app/outputs/bundle/release/app-release.aab
```
