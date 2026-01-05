# Mathe-Memory (Flutter)

Ein interaktives Lernspiel, mit dem Kinder und Schüler grundlegende mathematische Operationen spielerisch üben können. Die App nutzt das klassische Memory-Prinzip, um Rechenaufgaben mit ihren korrekten Ergebnissen zu verknüpfen.

## 🌟 Features

* **Pädagogischer Ansatz:** Statt identischer Bilder müssen Paare aus einer Rechenaufgabe (z. B. $7 \times 8$) und dem passenden Ergebnis ($56$) gefunden werden.
* **Intelligente Aufgabengenerierung:**
    * **Dynamische Aufgaben:** Jede Spielrunde generiert neue, zufällige Aufgaben.
    * **Keine Negativwerte:** Bei Subtraktionen wird automatisch sichergestellt, dass das Ergebnis positiv bleibt.
    * **Ganzzahlige Division:** Aufgaben werden so konstruiert, dass Divisionen immer ohne Rest aufgehen.
    * **Eindeutigkeit:** Ein interner Prüfalgorithmus verhindert, dass verschiedene Aufgabenpaare das gleiche Ergebnis haben, um Doppeldeutigkeiten zu vermeiden.
* **Visuelles Feedback:** Karten ändern ihren Status beim Umdrehen und Kennzeichnen gefundene Paare farblich.
* **Fortschrittsanzeige:** Ein integrierter Versuchszähler (TryCounter) überwacht die Effizienz der Spielrunde.

## 🛠️ Technische Details

Das Projekt wurde von einer ursprünglichen React-Webanwendung auf **Flutter** portiert, um eine native Performance auf Android und iOS zu gewährleisten.

### Kernkomponenten

* **Logic (Dart):** Die mathematische Logik ist strikt vom UI getrennt. Die Klasse `Equation` übernimmt die Berechnung und Validierung der Terme.
* **State Management:** Die Spielsteuerung (Matching-Logik, Timer für das Zurückdrehen falscher Paare) erfolgt zentral im `Playingfield`-Widget.
* **Responsive UI:** Das Spielfeld nutzt ein Grid-Layout, das sich automatisch an verschiedene Bildschirmgrößen anpasst.

## 🗺️ Roadmap

Die aktuelle Version befindet sich in der funktionalen Prototypen-Phase. Folgende Ausbaustufen sind geplant:

### Phase 1: UX & Design (In Entwicklung)
* **Finales Design-Konzept:** Ablösung des aktuellen provisorischen Farbschemas durch ein modernes, kinderfreundliches UI/UX.
* **Asset-Integration:** Implementierung von Icons und benutzerdefinierten Schriftarten.
* **Animationen:** Einführung von komplexeren Flip-Animationen und Partikeleffekten bei Treffern.

### Phase 2: Erweiterte Features
* **Schwierigkeitsgrade:** Einstellbare Zahlenräume (z. B. 0-10, 0-100) und Auswahl spezifischer Operatoren.
* **Highscore-System:** Lokale Speicherung der besten Zeiten und geringsten Versuchsanzahlen.
* **Audio-Feedback:** Integration von Soundeffekten für Klicks, Treffer und Spielabschluss.

## 🚀 Installation & Start

1.  **Voraussetzungen:** Installiertes Flutter SDK.
2.  **Abhängigkeiten laden:**
    ```bash
    flutter pub get
    ```
3.  **App starten:**
    ```bash
    flutter run
    ```

## 📖 Spielregeln

1. Tippe eine Karte an, um eine Rechenaufgabe zu sehen.
2. Finde die dazugehörige Ergebniskarte.
3. Hast du ein falsches Paar erwischt, bleiben die Karten kurz offen, damit du dir die Positionen merken kannst, bevor sie sich wieder verdeckt drehen.
4. Das Spiel endet, wenn alle 8 Paare gefunden wurden.