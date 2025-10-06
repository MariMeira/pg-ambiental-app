# 📱 PG Ambiental - App de Gestão de Resíduos

## 🎓 **Projeto Acadêmico - Entrega de Faculdade**

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-2.17+-0175C2?style=for-the-badge&logo=dart)
![Android](https://img.shields.io/badge/Android-4.4+-3DDC84?style=for-the-badge&logo=android)

**Sistema completo para gestão de coleta de resíduos no município de Ponta Grossa**

</div>

## 📋 **Índice**
- [📖 Sobre o Projeto](#-sobre-o-projeto)
- [🎯 Funcionalidades](#-funcionalidades)
- [🏗️ Arquitetura](#️-arquitetura)
- [📁 Estrutura do Projeto](#-estrutura-do-projeto)
- [🚀 Como Usar o APK](#-como-usar-o-apk)
- [👨‍💻 Desenvolvimento](#-desenvolvimento)
- [📸 Telas do Sistema](#-telas-do-sistema)
- [🔧 Tecnologias](#-tecnologias)

---

## 📖 **Sobre o Projeto**

O **PG Ambiental** é um aplicativo móvel desenvolvido em Flutter que oferece soluções integradas para gestão de resíduos sólidos urbanos. O sistema auxilia cidadãos e gestores públicos no acompanhamento de rotas de coleta, localização de pontos de entrega voluntária e acesso a informações sobre coleta seletiva.

### **🎯 Objetivo**
Facilitar o acesso à informação sobre gestão de resíduos, promovendo a conscientização ambiental e melhorando a eficiência dos serviços públicos.

### **📚 Contexto Acadêmico**
- **Disciplina**: Projeto Integrador I & II
- **Curso**: Análise e Desenvolvimento de Sistemas
- **Instituição**: Facint
- **Semestre**: 02/2025
- **Data de Entrega**: 15/10/2025

---

## 🎯 **Funcionalidades**

### **📍 Mapeamento e Localização**
- **Mapa Interativo** com rotas de coleta domiciliar e seletiva
- **Geolocalização** do usuário em tempo real
- **Busca de endereços** e cálculo de rotas
- **Visualização de setores** de coleta com polígonos coloridos

### **🏠 Gestão de Endereços**
- **Cadastro múltiplo** de endereços residenciais
- **Busca por CEP** automática via API
- **Geocoding** para conversão endereço↔coordenadas
- **Endereço padrão** para consultas rápidas

### **🗑️ Informações de Coleta**
- **Coleta Domiciliar**: Dias, horários e setores
- **Coleta Seletiva**: Rotas específicas e cronogramas
- **Próxima coleta** calculada automaticamente
- **Detalhes completos** por região

### **♻️ Pontos de Entrega Voluntária (PEVs)**
- **Catálogo completo** de PEVs do município
- **Filtros** por bairro e tipo de resíduo
- **Localização no mapa** com navegação integrada
- **Informações detalhadas** de cada ponto

### **🏭 Associações de Catadores**
- **Mapeamento** de cooperativas e associações
- **Informações de contato** e horários
- **Tipos de materiais** aceitos
- **Integração** com rotas de coleta seletiva

---

## 🏗️ **Arquitetura**

### **Padrão MVC (Model-View-Controller)**
```plaintext
📦 Arquitetura do Sistema
├── 🎨 View (UI)
│   ├── home_page.dart
│   ├── perfil_page.dart
│   ├── mapa_page.dart
│   └── pevs_associacoes_page.dart
├── ⚙️ Controller
│   ├── mapa_controller.dart
│   └── data_service.dart
├── 📊 Model
│   ├── endereco_model.dart
│   ├── setor_model.dart
│   ├── pev_model.dart
│   └── associacao_model.dart
└── 🔧 Services
    ├── kml_data_service.dart
    ├── geocoding_service.dart
    └── storage_service.dart
```

### **🔄 Fluxo de Dados**
1. **Interface** → Solicita dados do usuário
2. **Controller** → Processa lógica de negócio
3. **Service** → Acessa dados externos (KML, APIs)
4. **Model** → Estrutura e valida dados
5. **View** → Apresenta resultados

---

## 📁 **Estrutura do Projeto**
```plaintext
pg-ambiental-app/
├── 📄 main.dart                    # Ponto de entrada
├── 📄 home_page.dart               # Tela principal
├── 📁 pages/                       # Telas do aplicativo
│   ├── perfil_page.dart            # Gestão de endereços
│   ├── mapa_page.dart              # Mapa interativo
│   └── pevs_associacoes_page.dart  # Catálogo PEVs
├── 📁 services/                    # Lógica de negócio
│   ├── data_service.dart           # Gerenciador principal
│   ├── kml_data_service.dart       # Processamento KML
│   └── mapa_controller.dart        # Controle do mapa
├── 📁 models/                      # Estruturas de dados
│   ├── endereco_model.dart         # Modelo de endereço
│   ├── setor_model.dart            # Modelo de setor
│   ├── pev_model.dart              # Modelo de PEV
│   └── associacao_model.dart       # Modelo de associação
├── 📁 widgets/                     # Componentes UI
│   ├── mapa_widgets.dart           # Componentes do mapa
│   ├── filtros_panel.dart          # Painel de filtros
│   └── legenda_panel.dart          # Legenda interativa
├── 📁 assets/                      # Recursos estáticos
│   └── 📁 images/                  # Imagens e ícones
└── 📄 pubspec.yaml                 # Dependências Flutter
```
---

## 🚀 **Como Usar o APK**

### **📲 Instalação do Aplicativo**

1. **Localize o arquivo APK:**

pg-ambiental-app/build/app/outputs/apk/release/app-release.apk


2. **Instale no dispositivo Android:**
- Transfira o arquivo `.apk` para seu smartphone
- Habilite **"Fontes desconhecidas"** nas configurações de segurança
- Toque no arquivo para iniciar a instalação
- Siga as instruções na tela

3. **Permissões necessárias:**
- ✅ Localização (para mapas e geolocalização)
- ✅ Armazenamento (para cache de dados)
- ✅ Internet (para carregar mapas e dados)

### **📱 Primeiro Uso**

1. **Abra o aplicativo** após a instalação
2. **Cadastre seu endereço** na tela de perfil
3. **Explore o mapa** para ver rotas de coleta
4. **Consulte PEVs** e associações próximas

---

## 👨‍💻 **Desenvolvimento**

### **👤 Desenvolvedora**
- **Nome**: Mariana Meira da Rocha
- **Matrícula**: 202408746
- **Email**: marimeira.r@gmail.com

### **📊 Dados e Fontes**
- **Dados de coleta**: Baseados em informações públicas do município
- **Mapas KML**: Processados a partir de shapes oficiais
- **Geocoding**: Integração com serviços de geolocalização
- **Storage**: Persistência local com Shared Preferences

### **🎨 Design e UX**
- **Material Design** seguindo guidelines do Flutter
- **Cores temáticas** verde (ambiental)
- **Navegação intuitiva** com abas e drawers
- **Responsividade** para diferentes tamanhos de tela

### **⚡ Performance**
- **Carregamento incremental** de dados pesados
- **Cache inteligente** de mapas e polígonos
- **Otimização** de renderização de marcadores
- **Streams** para atualizações em tempo real

---

## 📸 **Telas do Sistema**

### **🏠 Tela Inicial (Home)**
- Dashboard com informações de coleta
- Seleção de endereço cadastrado
- Abas para coleta domiciliar e seletiva
- Cards informativos e serviços

### **🗺️ Mapa Interativo**
- Visualização de setores de coleta
- Marcadores de PEVs e associações
- Filtros por tipo e categoria
- Navegação e cálculo de rotas

### **👤 Perfil e Endereços**
- Cadastro e gestão de múltiplos endereços
- Busca automática por CEP
- Geocoding de coordenadas
- Definição de endereço padrão

### **♻️ Catálogo PEVs**
- Lista completa de pontos de entrega
- Filtros por bairro e tipo de resíduo
- Integração com mapa
- Informações detalhadas de cada ponto

---

## 🔧 **Tecnologias**

### **🛠️ Framework Principal**
- **Flutter 3.0+** - Framework cross-platform
- **Dart 2.17+** - Linguagem de programação

### **🗺️ Mapeamento e Localização**
- **flutter_map** - Mapa interativo baseado em OpenStreetMap
- **latlong2** - Manipulação de coordenadas geográficas
- **geocoding** - Conversão endereço↔coordenadas

### **💾 Armazenamento e Estado**
- **shared_preferences** - Persistência local de dados
- **Provider** - Gerenciamento de estado

### **🌐 Comunicação e Dados**
- **http** - Requisições HTTP para APIs
- **xml** - Processamento de arquivos KML
- **url_launcher** - Integração com apps externos

### **📦 Dependências Principais**
```yaml
dependencies:
flutter:
 sdk: flutter
flutter_map: ^6.1.0
latlong2: ^0.8.1
geocoding: ^2.1.0
shared_preferences: ^2.2.2
http: ^1.1.0
url_launcher: ^6.1.0
provider: ^6.0.0
```

⚠️ Observações
Este é um protótipo funcional para fins acadêmicos

Algumas funcionalidades podem requerer ajustes para produção

Os dados utilizados são para demonstração

O código fonte está obscurecido para entrega

🎓 Considerações Finais
"Tecnologia a serviço da sustentabilidade urbana"

Este projeto foi desenvolvido como parte do aprendizado em desenvolvimento mobile com Flutter. Através desta aplicação, explorei conceitos importantes como integração com mapas, gerenciamento de estado, persistência de dados e criação de interfaces responsivas.

Cada componente foi implementado visando demonstrar as competências adquiridas durante o curso e cuidadosamente planejado para oferecer uma experiência completa de gestão ambiental urbana, integrando conceitos avançados de programação, UX/UI design e arquitetura de software.

🚀 O futuro da gestão pública está na palma da mão!

<div align="center">
Facint - Análise e Desenvolvimento de Sistemas
Projeto Integrador I & II - 2025

</div> ```
