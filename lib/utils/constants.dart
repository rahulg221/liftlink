import 'package:supabase_flutter/supabase_flutter.dart';

const customFont = 'Poppins';

const double iconSize = 22.0;

const String dummyImage =
    'https://th.bing.com/th/id/R.da77fab58ab6d84d939414e63c00a8e5?rik=ymxiXmqouWX1pA&pid=ImgRaw&r=0';

const String supabaseUrl = 'https://bmjgtviajuoydiinfonq.supabase.co';

const String supabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJtamd0dmlhanVveWRpaW5mb25xIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk3NTM0MjksImV4cCI6MjAyNTMyOTQyOX0.xaZE_evoEPW5nDlIr1NMvYSw8scNx13CZsnRkoXQ2JA';

final supabase = Supabase.instance.client;
