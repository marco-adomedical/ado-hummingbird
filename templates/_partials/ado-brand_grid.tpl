{*
  ===================================
  H: ADO BRAND GRID
  ===================================
  Griglia brand homepage - usa immagini native PrestaShop
*}

<section class="ado-home-brands my-5">
  <div class="container">
    <div class="ado-home-brands__grid">

      {foreach from=$brands item=brand}
        <a class="ado-home-brands__item" href="{$brand.link|escape:'html':'UTF-8'}"
          title="{$brand.name|escape:'html':'UTF-8'}" aria-label="{$brand.name|escape:'html':'UTF-8'}">

          {* {if isset($brand.image) && isset($brand.image.bySize.medium_default.url)}
            <img class="ado-home-brands__logo" src="{$brand.image.bySize.medium_default.url}"
              alt="{$brand.name|escape:'html':'UTF-8'}" loading="lazy" decoding="async">
          {else}
            <img class="ado-home-brands__logo" src="{$urls.no_picture_image.bySize.medium_default.url}"
              alt="{$brand.name|escape:'html':'UTF-8'}" loading="lazy" decoding="async">
          {/if} *}
          <pre style="font-size:10px;">
              ID: {$brand.id_manufacturer}
              NAME: {$brand.name}
              IMAGE: {$brand.image}
              LINK: {$brand.link}
            </pre>
        </a>
      {/foreach}

    </div>
  </div>
</section>
