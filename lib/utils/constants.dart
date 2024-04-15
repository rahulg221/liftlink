import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const customFont = 'Lexed';

const double iconSize = 22.0;

bool isWeb = kIsWeb;

const String dummyImage =
    'https://th.bing.com/th/id/OIP.YSYxVaBSQvug04Y_kysOgwHaJQ?w=146&h=181&c=7&r=0&o=5&pid=1.7';

const String supabaseUrl = 'https://bmjgtviajuoydiinfonq.supabase.co';

const String supabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJtamd0dmlhanVveWRpaW5mb25xIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk3NTM0MjksImV4cCI6MjAyNTMyOTQyOX0.xaZE_evoEPW5nDlIr1NMvYSw8scNx13CZsnRkoXQ2JA';

final supabase = Supabase.instance.client;
