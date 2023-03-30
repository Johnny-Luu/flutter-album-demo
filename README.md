# Album Demo

### Business

A Flutter project for visualizing user's data from an external resource, consist of features:

- Dark/Light mode.
- Listview/Gridview mode.
- Loading skeleton.
- Auto load more.
- Auto refresh.

### How to run (v3.7.3 - Channel stable)

1/ Install packages:

```
$ flutter pub get
```

2/ Auto generate files, run:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

3/ Make sure you have connected to at least 1 emulator
4/ Run:

```
flutter run
```

- Note: if you're connecting to multiple emulators, choose one and Enter.

### Code Structure

```
📦assets                        <--- application's assets
 ┣ 📂fonts
 ┣ 📂icons
 ┗ 📂images
📦lib
 ┣ 📂application                <--- application layer
 ┃ ┣ 📂repositories             <--- abstract repo, application business
 ┃ ┣ 📂usecases                 <--- business usecases
 ┣ 📂config                     <--- external's resource config
 ┣ 📂data                       <--- data layer
 ┃ ┣ 📂api                      <--- api client
 ┃ ┣ 📂datasources              <--- local/remote/etc data sources
 ┃ ┣ 📂mapper                   <--- convert from external data sources to app's entites
 ┃ ┣ 📂models                   <--- external data source models
 ┣ 📂domain                     <--- domain layer
 ┃ ┣ 📂constants                <--- constant files
 ┃ ┣ 📂core                     <--- core assets
 ┃ ┣ 📂entities                 <--- app's entities
 ┃ ┣ 📂enums                    <--- app's enums
 ┣ 📂infrastructure             <--- infrastructure layer
 ┃ ┣ 📂repositories             <--- repository implementations
 ┣ 📂presentation               <--- presentation layer
 ┃ ┣ 📂base                     <--- presentation's base config
 ┃ ┃ ┣ 📂bloc                   <--- base Bloc
 ┃ ┃ ┣ 📂theme                  <--- theme config
 ┃ ┃ ┗ 📂widget                 <--- base widgets
 ┃ ┣ 📂features                 <--- app's features
 ┣ 📜injection_container.dart   <--- app's DI
 ┗ 📜main.dart
 📦test                         <--- test cases
 ┣ 📂application                <--- application's test cases
 ┃ ┗ 📂usecase
 ┣ 📂data                       <--- data's test cases
 ┃ ┣ 📂datasources
 ┃ ┗ 📂models
 ┣ 📂fixtures                   <--- mock Json data
 ┃ ┣ 📂users
 ┣ 📂infrastructure             <--- infrastructure's test cases
 ┃ ┗ 📂repositories
 ┣ 📂mock_data                  <--- mock application's data
 ┗ 📂presentation               <--- presentation's test cases
 ┃ ┣ 📂blocs
 ┃ ┗ 📂views
```

### Unit test

1/ Auto generate files, run:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

2/ Run unit test:

```
flutter test
```

### Deploy to Github Release

1/ Create a non-existing tag (Ex: v1.x):

```
git tag [version]
```

2/ Push tag to trigger Github's Action:

```
git push origin [version]
```

### Screenshots

![Light - Listview](assets/screenshots/1.png?raw=true)
![Light - Gridview](assets/screenshots/2.png?raw=true)
![Dark - Listview](assets/screenshots/3.png?raw=true)
![Dark - Gridview](assets/screenshots/4.png?raw=true)
![Light - Skeleton Listview](assets/screenshots/5.png?raw=true)
![Light - Skeleton Gridview](assets/screenshots/6.png?raw=true)
![Dark - Skeleton Listview](assets/screenshots/7.png?raw=true)
![Dark - Skeleton Gridview](assets/screenshots/8.png?raw=true)
