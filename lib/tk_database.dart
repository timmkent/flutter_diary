// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class TKDatabase {
  static Future<bool> configureDatabases() async {
    // const configFlutter = FirebaseOptions(
    //     apiKey: 'AIzaSyDhmG_Lpu1KZQuTwmZfSmHSBJyLussawgM',
    //     authDomain: 'flutterdb-b6d9d.firebaseapp.com',
    //     projectId: 'flutterdb-b6d9d',
    //     messagingSenderId: '841214087259',
    //     appId: '1:841214087259:ios:ce9d9d8807abcac6f72f7e');

    // const configWE = FirebaseOptions(
    //     apiKey: 'AIzaSyCe8QgYLK9I3zPj9bx9YYm1AxIEr5cTqdI',
    //     authDomain: 'weapp-6dea6.firebaseapp.com',
    //     projectId: 'weapp-6dea6',
    //     messagingSenderId: '841214087259',
    //     appId: '1:62373547803:ios:023172d10c6f1e5947cdbe');

    // const configMBA = FirebaseOptions(
    //     apiKey: 'AIzaSyCnOdL6OwsER07UDIo7H6jMZAowoog01Vo',
    //     authDomain: 'myboyandroid.firebaseapp.com',
    //     projectId: 'myboyandroid',
    //     messagingSenderId: '972700247431',
    //     appId: '1:972700247431:android:9155ea76aa208f2e1b9f22');

    // const configMB = FirebaseOptions(
    //     apiKey: 'AIzaSyBcgtibPpuNxIqTsEFxuAKB2OX163d3F3w',
    //     authDomain: 'myboy-f2807.firebaseapp.com',
    //     projectId: 'myboy-f2807',
    //     messagingSenderId: '355155790549',
    //     databaseURL: 'https://myboy-f2807.firebaseio.com',
    //     appId: '1:355155790549:ios:d9b72bc1ce62ea2b');

    // const configStatsWeb = FirebaseOptions(
    //     apiKey: 'AIzaSyDZUkjuQCsXxTM_LFCjSOn2zrvYZeNcO6U',
    //     authDomain: 'stats-66195.firebaseapp.com',
    //     projectId: 'stats-66195',
    //     messagingSenderId: '1013228098221',
    //     appId: '1:1013228098221:web:a75285f0a2d6562df76c24');

    const configNB = FirebaseOptions(
        apiKey: 'AIzaSyBMeUM-7PxKt1bdoV_vxsYc-VpFyS3bbNo',
        authDomain: 'nextboy-f45b3.firebaseapp.com',
        projectId: 'nextboy-f45b3',
        messagingSenderId: '441002393476',
        databaseURL: 'https://nextboy-f45b3.firebaseio.com',
        storageBucket: 'nextboy-f45b3.appspot.com',
        appId: '1:441002393476:ios:442813749dccf0d1');

    const configBodyStatsiOS = FirebaseOptions(
        apiKey: 'AIzaSyC9XimsCbNImxxB37423PEKqC1_UBywOzc',
        authDomain: 'bodystats-54c9b.firebaseapp.com',
        projectId: 'bodystats-54c9b',
        messagingSenderId: '253676633846',
        databaseURL: 'https://bodystats-54c9b-default-rtdb.europe-west1.firebasedatabase.app',
        storageBucket: 'nextboy-f45b3.appspot.com',
        appId: '1:253676633846:ios:e51336079274ff2f5e76d7');

    const configStatsiOS = FirebaseOptions(apiKey: 'AIzaSyDZUkjuQCsXxTM_LFCjSOn2zrvYZeNcO6U', authDomain: 'stats-66195.firebaseapp.com', projectId: 'stats-66195', messagingSenderId: '1013228098221', appId: '1:1013228098221:ios:1e9b8d063d062bf7f76c24');

    const configLogger = FirebaseOptions(apiKey: 'AIzaSyBr0tJ5544VBiCU95vLzJgI8OjF03ucy_0', authDomain: 'loggerdb-d24a0.firebaseapp.com', projectId: 'loggerdb-d24a0', messagingSenderId: '1086191372352', appId: '1:1086191372352:ios:6645d1e8a6609d2a64f7a5');

    const configDashboard =
        FirebaseOptions(apiKey: 'AIzaSyCTsRRhi9KHdIQBR4WdHhJsOJEWc2a_zes', databaseURL: 'https://dashboard-de8e7.firebaseio.com', authDomain: 'dashboard-de8e7.firebaseapp.com', projectId: 'dashboard-de8e7', messagingSenderId: '529172679885', appId: '1:529172679885:ios:81738e5d90e76d12');

    await Firebase.initializeApp(options: configNB);
//  await Firebase.initializeApp(name: "we", options: configWE);
    //await Firebase.initializeApp(name: "mb", options: configMB);
    // await Firebase.initializeApp(name: "mba", options: configMBA);
    await Firebase.initializeApp(name: "stats", options: configStatsiOS);
    await Firebase.initializeApp(name: "logger", options: configLogger);
    await Firebase.initializeApp(name: "dashboard", options: configDashboard);
    await Firebase.initializeApp(name: "bodystats", options: configBodyStatsiOS);
    return true;
  }

  static FirebaseDatabase dashboard() {
    return FirebaseDatabase.instanceFor(app: Firebase.app("dashboard"));
  }
  static FirebaseDatabase logger() {
    return FirebaseDatabase.instanceFor(app: Firebase.app("logger"));
  }
  static FirebaseDatabase stats() {
    return FirebaseDatabase.instanceFor(app: Firebase.app("stats"));
  }
    static FirebaseDatabase bodystats() {
    return FirebaseDatabase.instanceFor(app: Firebase.app("bodystats"));
  }
}
