import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visa_arapiraca_app/presentation/pages/Termos/termos.dart';
import 'package:visa_arapiraca_app/presentation/pages/cnaes/cnaes.dart';
import 'package:visa_arapiraca_app/presentation/pages/home/dashboard.dart';
import 'package:visa_arapiraca_app/presentation/pages/home/home.dart';
import 'package:visa_arapiraca_app/presentation/pages/login/login.dart';
import 'package:visa_arapiraca_app/presentation/pages/producao/producao_diaria.dart';
import 'package:visa_arapiraca_app/presentation/pages/recuperar_senha/recuperar_senha.dart';
import 'package:visa_arapiraca_app/presentation/pages/termos/parecer-sanitario.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => Login()),
    GoRoute(
      path: '/recuperar-acesso',
      builder: (context, state) => RecuperarSenha(),
    ),
    ShellRoute(
      builder: (context, state, child) => Dashboard(content: child),
      routes: [
        GoRoute(path: '/dashboard', builder: (context, state) => Home()),
        GoRoute(path: '/termos', builder: (context, state) => TermosPage()),
        GoRoute(
          path: '/termos/parecer-sanitario',
          builder: (context, state) => ParecerSanitarioPage(),
        ),
        GoRoute(path: '/producao', builder: (context, state) => ProducaoPage()),
        GoRoute(
          path: '/estabelecimentos',
          builder: (context, state) =>
              Center(child: Text('Página em construção')),
        ),
        GoRoute(path: '/lista-cnaes', builder: (context, state) => CnaesPage()),
        GoRoute(
          path: '/notificacoes',
          builder: (context, state) =>
              Center(child: Text('Página em construção')),
        ),
      ],
    ),
  ],
);
