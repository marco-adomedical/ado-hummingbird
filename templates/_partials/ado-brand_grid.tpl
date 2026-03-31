{*
  ===================================
  H: ADO BRAND GRID
  ===================================
  Variante custom per homepage:
  visualizzazione brand come griglia di loghi responsive.

  NOTA TEMPORANEA DEV:
  in ambiente di test i manufacturer hanno offset +70000,
  mentre le immagini copiate mantengono il nome con ID originale.
  Al momento del go-live questo hack va rimosso.
*}

<section class="ado-home-brands my-5">
  <div class="container">
    <div class="ado-home-brands__grid">
      {foreach from=$brands item=brand}
        {assign var="originalManufacturerId" value=$brand.id_manufacturer-70000}
        {assign var="brandLogo" value="{$urls.base_url}img/m/{$originalManufacturerId|intval}-medium_default.jpg"}

        <a class="ado-home-brands__item" href="{$brand.link|escape:'html':'UTF-8'}"
          title="{$brand.name|escape:'html':'UTF-8'}" aria-label="{$brand.name|escape:'html':'UTF-8'}">
          <img class="ado-home-brands__logo" src="{$brandLogo|escape:'html':'UTF-8'}"
            alt="{$brand.name|escape:'html':'UTF-8'}" loading="lazy" decoding="async">
        </a>
      {/foreach}
    </div>
  </div>
</section>
