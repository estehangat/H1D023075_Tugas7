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
Mengecek apakah user sudah login atau belum, data disimpan di `SharedPreferences` dan mengembalikan nilai `true` or `false`.

### `storage.dart`
```dart
static Future<void> login() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', true);
}
```
Menyimpan status login dan mengubah nilai `isLoggedIn` menjadi `true`.

```dart
static Future<void> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
```
Menghapus semua data di `SharedPreferences`, termasuk status login.

### `login_page.dart`
```dart
final TextEditingController user = TextEditingController();
final TextEditingController pass = TextEditingController();
```
Mengambil data dari input username dan password.

```dart
void handleLogin(BuildContext context) async {
  if (user.text == "admin" && pass.text == "admin") {
    await StorageService.login();
    Navigator.pushReplacementNamed(context, '/home');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login gagal")),
    );
  }
}
```
Validasi username dan password, jika benar maka simpan status login dan pindah ke Home, jika salah maka tampilkan Snackbar.

### `home_page.dart`
```dart
final pages = [
  Center(child: Text("Dashboard", style: TextStyle(fontSize: 24))),
  ProfilePage(),
  SettingsPage(),
];
```
Menyimpan setiap halaman yang ditampilkan sesuai navbar.

```dart
bottomNavigationBar: BottomNav(
  currentIndex: index,
  onTap: (i) => setState(() => index = i),
),
```
Menggunakan widget custom BottomNav, saat user klik item navbar mana halaman akan berubah.

### `profile_page.dart`
```dart
return Center(
  child: Text("Profile Page", style: TextStyle(fontSize: 24)),
);
```
Menampilkan text "Profile Page".

### `settings_page.dart`
```dart
Future<void> handleLogout(BuildContext context) async {
  await StorageService.logout();
  Navigator.pushReplacementNamed(context, '/login');
}
```
Log Out dengan menghapus data login serta mengarahkan user kembali ke halaman login.

### `navbar.dart`
```dart
BottomNavigationBar(
  currentIndex: currentIndex,
  onTap: onTap,
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ],
)
```
Navbar dengan 3 menu serta ikon yang modern. Bisa dipakai ulang halaman lain.
