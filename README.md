# 📍 FastLocation

Aplicativo Flutter desenvolvido como parte do Desafio 1 - Desenvolvimento de Sistemas Móveis e Distribuídos, com o objetivo de consultar endereços por CEP e traçar rotas de forma rápida e prática.  

Este projeto foi construído com foco em **boas práticas de arquitetura**, **armazenamento local com Hive**, **estado reativo com MobX** e **integração com APIs externas** (ViaCEP, MapLauncher, Geocoding).

---

## 🚀 Funcionalidades

- 🔎 Consulta de endereços por CEP via API [ViaCEP](https://viacep.com.br/ws).
- 💾 Armazenamento local dos endereços consultados usando Hive.
- 🕹️ Gerenciamento de estado reativo com MobX.
- 🌀 Splash Screen animada (InitialPage).
- ⏳ Indicador de carregamento durante a busca.
- 📭 Componente de busca vazia quando não há histórico.
- 📝 Histórico de consultas:
  - Listagem de todos os CEPs buscados.
  - Opção para **limpar histórico**.
- 🧭 Traçar rota:
  - Abre aplicativos de navegação instalados (Google Maps, Waze, etc.) com o último endereço consultado.

---

## 🛠️ Tecnologias e Bibliotecas

- [Flutter](https://flutter.dev/) — SDK multiplataforma.
- [Dio](https://pub.dev/packages/dio) — Requisições HTTP.
- [MobX](https://pub.dev/packages/mobx) & [flutter_mobx](https://pub.dev/packages/flutter_mobx) — Gerenciamento de estado reativo.
- [Hive](https://pub.dev/packages/hive) & [hive_flutter](https://pub.dev/packages/hive_flutter) — Banco de dados local leve.
- [build_runner](https://pub.dev/packages/build_runner), [mobx_codegen](https://pub.dev/packages/mobx_codegen), [hive_generator](https://pub.dev/packages/hive_generator) — Geração de código.
- [map_launcher](https://pub.dev/packages/map_launcher) — Abrir apps de mapas instalados.
- [geocoding](https://pub.dev/packages/geocoding) — Conversão de endereço em coordenadas.

---

## 📂 Estrutura de Pastas

```
lib/
 └── src/
     ├── http/                  # Configuração do Dio
     ├── modules/
     │   ├── initial/           # Splash screen
     │   ├── home/              # Módulo principal
     │   │   ├── components/    # UI reaproveitável (lista, último endereço, vazio)
     │   │   ├── controller/    # MobX Controller
     │   │   ├── model/         # Model Address (Hive + JSON)
     │   │   ├── page/          # Tela principal
     │   │   ├── repositories/  # API e Local (Hive)
     │   │   └── service/       # Regras de negócio
     │   └── history/           # Tela de histórico
     ├── routes/                # Definição das rotas
     └── shared/                # Recursos compartilhados (cores, storage, widgets)
```

---

## ⚙️ Instalação e Execução

### 1. Clone o repositório

git clone https://github.com/Septso/fast_location.git
cd fast_location

### 2. Instale as dependências

flutter pub get


### 3. Gere os arquivos automáticos (MobX + Hive)

dart run build_runner build --delete-conflicting-outputs


### 4. Rode o projeto

flutter run


---

## 📱 Permissões

Arquivo: `android/app/src/main/AndroidManifest.xml`
<uses-permission android:name="android.permission.INTERNET"/>


---

## 🎯 Resultado Esperado

- App inicia na tela de abertura animada (InitialPage).  
- Redireciona automaticamente para a Home.  
- Usuário consulta um CEP → exibe dados do endereço.  
- Endereço é salvo no histórico (Hive).  
- Usuário pode acessar a tela de histórico e limpar consultas.  
- Último endereço consultado pode ser usado para abrir rota no Google Maps/Waze.  

---

## 👨‍💻 Autor

**Ian Carvalhaes Costa (Septso)**  
Desenvolvedor responsável pelo projeto FastLocation no contexto da disciplina **Desenvolvimento de Sistemas Móveis e Distribuídos**.

---
