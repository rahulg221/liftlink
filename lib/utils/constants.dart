import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const customFont = 'Lexed';

const double iconSize = 21.0;

bool isWeb = kIsWeb;

const String dummyImage =
    'https://i.pinimg.com/originals/8e/6c/41/8e6c415ce319ca467b93c529bc1f3724.jpg';

const String supabaseUrl = 'https://bmjgtviajuoydiinfonq.supabase.co';

const String supabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJtamd0dmlhanVveWRpaW5mb25xIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk3NTM0MjksImV4cCI6MjAyNTMyOTQyOX0.xaZE_evoEPW5nDlIr1NMvYSw8scNx13CZsnRkoXQ2JA';

final supabase = Supabase.instance.client;
