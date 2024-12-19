 
    import 'src/core/config/config.dart';
    import 'package:flutter/material.dart';
    import 're_name.dart';

    Future<void> main() async {
        await DependencyInjection.init();
        runApp(RootApp());
    }
    