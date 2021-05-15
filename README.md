# quill-django-flutter-example
Example for quill in Django and Flutter

## Run server

### Install python dependencies

```
python3 -m pip install -r server/requirements.txt
```

### Start development server

```
python3 server/manage.py runserver 0.0.0.0:8000 
```

## Run app

### Install dependencies

```
cd app
flutter pub get
```

### Edit your server IP

#### app/lib/main.dart

```flutter
void fetchAPI() async {
  var response = await http.get(Uri(
    scheme: "http",
    host: "192.168.0.4",
    port: 8000,
    path: "/description",
  ));
```
### Run app

```
flutter run
```
