import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const customFont = 'Lexed';

const double iconSize = 22.0;

bool isWeb = kIsWeb;

const String dummyImage =
    'https://th.bing.com/th/id/OIP.YSYxVaBSQvug04Y_kysOgwHaJQ?w=146&h=181&c=7&r=0&o=5&pid=1.7';

const String supabaseUrl = 'https://lzozirtdefpxzbpocjeh.supabase.co';

const String supabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx6b3ppcnRkZWZweHpicG9jamVoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMxMjI4MzYsImV4cCI6MjAyODY5ODgzNn0.MdvXlGrqtuZHHwaogMVi0i8VuCj2CKPVMQ8ooJofhXA';

final supabase = Supabase.instance.client;
