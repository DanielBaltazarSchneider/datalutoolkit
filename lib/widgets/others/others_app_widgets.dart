import 'package:datalutoolkit/extension/context/context.dart';
import 'package:flutter/material.dart';

import '../../dependencias/url_launch/url_launch_app.dart';

class OthersAppWidgets extends StatelessWidget {
  const OthersAppWidgets({super.key, this.hideApps = const []});

  final List<EnApp> hideApps;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              "Mais apps para você testar",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Visibility(
                  visible: !hideApps.contains(EnApp.amostragemSoloPro),
                  child: MeuAppWidget(
                    title: "Amostragem de Solo PRO",
                    asset: "assets/apps/amostragemsolopro.png",
                    onTap: () => UrlLaunchApp().launchURL("https://play.google.com/store/apps/details?id=br.com.datalu.amostragemsolopro"),
                  ),
                ),
                Visibility(
                  visible: !hideApps.contains(EnApp.amostragemSoloFree),
                  child: MeuAppWidget(
                    title: "Amostragem de Solo",
                    asset: "assets/apps/amostragemsolo.png",
                    onTap: () => UrlLaunchApp().launchURL("https://play.google.com/store/apps/details?id=br.com.datalu.amostragemsolopro"),
                  ),
                ),
                Visibility(
                  visible: !hideApps.contains(EnApp.calagemAdubacaoPro),
                  child: MeuAppWidget(
                    title: "Calagem & Adubação PRO",
                    asset: "assets/apps/calagemadubacaopro.png",
                    onTap: () => UrlLaunchApp().launchURL("https://play.google.com/store/apps/details?id=br.com.datalu.calagembrasilpro"),
                  ),
                ),
                Visibility(
                  visible: !hideApps.contains(EnApp.calagemAdubacaoFree),
                  child: MeuAppWidget(
                    title: "Calagem & Adubação FREE",
                    asset: "assets/apps/calagemadubacaofree.png",
                    onTap: () => UrlLaunchApp().launchURL("https://play.google.com/store/apps/details?id=br.com.stringsoft.calagem_brasil"),
                  ),
                ),
                Visibility(
                  visible: !hideApps.contains(EnApp.planteCerto),
                  child: MeuAppWidget(
                    title: "Cálculos de Plantio",
                    asset: "assets/apps/plantecerto.png",
                    onTap: () => UrlLaunchApp().launchURL("https://play.google.com/store/apps/details?id=br.com.datalu.plantecerto"),
                  ),
                ),
                Visibility(
                  visible: !hideApps.contains(EnApp.consultaVazio),
                  child: MeuAppWidget(
                    title: "Vazio Sanitário da Soja",
                    asset: "assets/apps/consultavazio.jpeg",
                    onTap: () => UrlLaunchApp().launchURL("https://play.google.com/store/apps/details?id=com.br.datalu.vaziosanitario"),
                  ),
                ),
                Visibility(
                  visible: !hideApps.contains(EnApp.marcadorArea),
                  child: MeuAppWidget(
                    title: "Marcador de áreas e distâncias",
                    asset: "assets/apps/marcadorareadistancias.png",
                    onTap: () => UrlLaunchApp().launchURL("https://play.google.com/store/apps/details?id=com.br.datalu.mapareacalculator"),
                  ),
                ),
                Visibility(
                  visible: !hideApps.contains(EnApp.qrCodeScannerGenerator),
                  child: MeuAppWidget(
                    title: "QR Code Scanner Gerador",
                    asset: "assets/apps/qrcodescanner.png",
                    onTap: () => UrlLaunchApp().launchURL("https://play.google.com/store/apps/details?id=br.com.datalu.qrcodegenerator"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum EnApp {
  calagemAdubacaoFree,
  calagemAdubacaoPro,
  amostragemSoloFree,
  amostragemSoloPro,
  marcadorArea,
  consultaVazio,
  qrCodeScannerGenerator,
  planteCerto,
}

class MeuAppWidget extends StatelessWidget {
  const MeuAppWidget({super.key, required this.title, required this.asset, required this.onTap});

  final String title;
  final String asset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          children: [
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  asset,
                  width: context.screenWidth * 0.25,
                ),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: context.screenWidth * 0.20,
              child: Text(
                title,
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
