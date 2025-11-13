# TUGAS 7 - PERTEMUAN 9

```
Nama      : Daiva Paundra Gevano
NIM       : H1D023075
Shift     : A
Shift KRS : F
```

<img width="489" height="796" alt="image" src="https://github.com/user-attachments/assets/b7c54316-05fa-4b90-bb0b-824e09df209d" />
<img width="490" height="796" alt="image" src="https://github.com/user-attachments/assets/2d305b8f-8491-49c5-8525-3dc34aa437f5" />
<img width="490" height="796" alt="image" src="https://github.com/user-attachments/assets/939bc07e-85bb-4b61-97e5-bf106add4749" />
<img width="490" height="795" alt="image" src="https://github.com/user-attachments/assets/52a22b57-8d99-4255-9ae6-b37ba436c55f" />

## Penjelasan Kode
### `main.dart`
```dart
Future<bool> checkLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}
```
Mengecek apakah user sudah login atau belum, data disimpan di `SharedPreferences` dan mengembalikan nilai `true` or `false`

