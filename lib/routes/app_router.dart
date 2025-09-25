import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visa_arapiraca_app/core/utils/session_helper.dart';
import 'package:visa_arapiraca_app/presentation/pages/Termos/termos.dart';
import 'package:visa_arapiraca_app/presentation/pages/cadastro/cadastro.dart';
import 'package:visa_arapiraca_app/presentation/pages/cnaes/cnaes.dart';
import 'package:visa_arapiraca_app/presentation/pages/home/dashboard.dart';
import 'package:visa_arapiraca_app/presentation/pages/home/home.dart';
import 'package:visa_arapiraca_app/presentation/pages/login/login.dart';
import 'package:visa_arapiraca_app/presentation/pages/producao/producao_diaria.dart';
import 'package:visa_arapiraca_app/presentation/pages/recuperar_senha/recuperar_senha.dart';
import 'package:visa_arapiraca_app/presentation/pages/termos/parecer-sanitario.dart';
import 'package:visa_arapiraca_app/presentation/pages/termos/termo-inspecao.dart';
import 'package:visa_arapiraca_app/presentation/pages/termos/termo-notificacao.dart';

String? authGuard(BuildContext context, GoRouterState state){
  final fiscal = StaticSessionHelper().currentFiscal;
  final location = state.matchedLocation;
  
  final publicRoutes = ['/login', '/cadastro', 'recuperar-acesso'];

  // Se já está logado e tenta acessar login/cadastrar/recuperar, redireciona para dashboard
  if (fiscal != null && publicRoutes.contains(location)) {
    return '/dashboard';
  }

  // Se não está logado e tenta acessar rota privada, redireciona para login
  if (fiscal == null && !publicRoutes.contains(location)) {
    return '/login';
  }

  // Caso contrário, permite acessar a rota
  return null;
}

final GoRouter router = GoRouter(
  initialLocation: '/cadastrar',
  redirect: authGuard,
  routes: [

    GoRoute(path: '/login', builder: (context, state) => Login()),
    GoRoute(path: '/recuperar-acesso',builder: (context, state) => RecuperarSenha()),
    GoRoute(path: '/', redirect: (context, state)=> '/dashboard'),
    GoRoute(path: '/cadastro', builder: (context, state) => Cadastro()),

    //Rotas de Dashboard e suas filhas
    ShellRoute(
      builder: (context, state, child) {
         final titles = {
          '/dashboard': "Dashboard",
          '/termos': "Termos",
          '/termos/parecer-sanitario': "Parecer Sanitário",
          '/termos/termo-inspecao': "Termo de Inspeção",
          '/termos/termo-notificacao': "Termo de Notificação",
          '/producao': "Produção",
          '/lista-cnaes': "CNAEs",
        };

        final title = titles[state.fullPath] ?? "VISA Arapiraca";

        return Dashboard(content: child, title: title);
      },
      routes: [
        GoRoute(path: '/dashboard', builder: (context, state) => Home()),
        GoRoute(path: '/termos', builder: (context, state) => TermosPage()),
        GoRoute(
          path: '/termos/parecer-sanitario',
          builder: (context, state) => ParecerSanitarioPage(),
        ),
        GoRoute(path: '/termos/termo-inspecao', builder: (context, state) => TermoInspecaoPage()),
        GoRoute(path: '/termos/termo-notificacao', builder: (context, state) => TermoNotificacaoPage()),
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
