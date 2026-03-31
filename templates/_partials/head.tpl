{*
  ===================================
  H: HEAD
  ===================================

  File base: Hummingbird
  Motivo: personalizzazione head / asset custom
  Nota: file modificato rispetto all'originale Hummingbird includendo i css ado
*}

{extends file='parent:_partials/head.tpl'}

{block name='stylesheets' append}
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&display=swap"
    rel="stylesheet">

  <link rel="stylesheet" href="{$urls.theme_assets}css/ado-brand.css">
  <link rel="stylesheet" href="{$urls.theme_assets}css/ado-custom.css">
{/block}
