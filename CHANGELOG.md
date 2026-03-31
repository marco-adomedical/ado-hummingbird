# 📈 Changelog

## 🚀 v0.2.0

### 🔁 Refactor architetturale

- Conversione tema in **child di Hummingbird**
- Eliminata copia completa del tema parent
- Riduzione drastica override

### 🧹 Cleanup

- Rimossi file inutili:
  - qty-input.tpl
  - cart-detailed-product-line.tpl
- Eliminato CUSTOMIZATIONS.md (sostituito da README + CHANGELOG)

### 🏠 Homepage

- Strutturazione via hook `displayHome`
- Introduzione modulo `adohomefeatured`
- Implementata griglia brand custom

### 🏷️ Brand

- Override `ps_brandlist.tpl`
- Creazione `_partials/ado-brand_grid.tpl`
- Pagina manufacturer con header custom

### 🖼️ Immagini

- Introduzione tipo `brand_default`
- Fix visualizzazione loghi brand

### 🛍️ PDP

- Layout migliorato
- Brand e Reference sotto al titolo
- Tabs full-width
- Integrazione sale_mode

### ⚙️ Tecnico

- Miglior gestione asset CSS
- Miglior separazione responsabilità (tema vs modulo)

---

## 🏁 v0.1.0

- Tema iniziale basato su copia completa Hummingbird
- Prime customizzazioni layout e homepage
- Setup base progetto
