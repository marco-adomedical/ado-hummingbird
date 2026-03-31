# 🚀 ADO Hummingbird Theme

Tema custom per A.D.O. Medical basato su **Hummingbird 2 (PrestaShop 9.1)**.

## 🎯 Obiettivo

Costruire tema per il nuovo e-commerce adomedical.it:

- pulito
- mantenibile
- aggiornabile senza conflitti
- orientato alla conversione B2B

---

## 🧱 Architettura

- Tema **child di Hummingbird 2**
- Nessuna copia completa del parent
- Override **solo dove necessario**
- Utilizzo estensivo di:
  - extends
  - hook
  - partial custom

---

## ⚙️ Scelte tecniche

- ❌ Eliminati override inutili:
  - qty-input.tpl
  - cart-detailed-product-line.tpl
- ✅ Uso componenti nativi Hummingbird quando funzionanti
- ✅ CSS organizzato in:
  - ado-brand.css
  - ado-custom.css
  - cartella `css/ado/` con partials css

---

## ⚠️ Nota bene:

### Offset

Abbiamo utilizzato offset per importare dati di test (categorie, prodotti, attributi, brand, ecc...)
Verranno rimossi all'import dei dati definitivi prima di Go-Live.

- rimuovere workaround temporaneo per le immagini dei brand: `id_manufacturer - 70000` da:
  - `ado-brand_grid.tpl`
  - `manufacturer.tpl`

---

## 📏 Regole di sviluppo

- Non copiare file interi dal parent se non necessario
- Preferire override mirati
- Non modificare mai Hummingbird
- Documentare hack temporanei
- Pensare sempre in ottica update-safe

---

## 📦 Stato attuale

- Tema stabile
- Struttura pulita
- Override ridotti al minimo
- Pronto per evoluzione e integrazione futura con ERP
