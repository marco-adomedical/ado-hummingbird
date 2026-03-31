# ado-hummingbird

Tema custom PrestaShop 9 di A.D.O. Medical, costruito come estensione di Hummingbird.

## Obiettivo

Fornire una base frontend pulita, manutenibile e orientata alla conversione per il nuovo e-commerce A.D.O. Medical su PrestaShop 9.

## Base tecnica

- PrestaShop 9.1+
- Tema parent: Hummingbird
- Tema custom: `ado_hummingbird`
- Approccio: inheritance + override mirati
- CSS custom modulari con prefisso `ado-`

## Principi del tema

- evitare copie inutili del tema parent
- mantenere solo override realmente necessari
- preferire estensioni pulite dove possibile
- ridurre il debito tecnico e facilitare gli aggiornamenti futuri

## Struttura del progetto

Il tema contiene solo:

- configurazione tema custom
- asset CSS ADO
- template realmente personalizzati
- eventuali override modulo necessari

Tutto il resto viene ereditato da Hummingbird.

## Convenzioni operative

- file modificati mappati in `CUSTOMIZATION.md`
- commenti di sezione con prefisso `H:`
- modifiche mirate, evitando over-engineering

## Contesto progetto

Questo tema è sviluppato nell’ambito della migrazione:

- PrestaShop 1.7.8.x → PrestaShop 9.1+
- nuova grafica frontend
- nuova base tecnica più pulita e aggiornabile
- dati reimportabili tramite script custom

## Stato

Tema in sviluppo su ambiente DEV.

Refactor architetturale in corso:

- passaggio da copia completa di Hummingbird a child theme reale
- pulizia file duplicati
- mantenimento dei soli override necessari

## Sviluppo

A.D.O. Medical s.r.l.
IT / Sviluppo: Marco Giuliani
