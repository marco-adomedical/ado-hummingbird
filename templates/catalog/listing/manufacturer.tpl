{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
  {*
    ===================================
    H: MANUFACTURER
    - lista prodotti di un Brand
    ===================================

    Header custom pagina brand:
    - titolo pulito (solo nome brand)
    - logo brand in evidenza
    - short description opzionale
    - description lunga sotto

    Nota temporanea DEV:
    l'ID manufacturer è importato con offset +70000.
    Per costruire il path del logo usiamo quindi id_manufacturer - 70000.
    DA RIMUOVERE al go-live con import definitivo senza offset.
  *}

  {assign var='originalManufacturerId' value=$manufacturer.id|intval - 70000}
  {assign var='brandLogo' value="{$urls.base_url}img/m/{$originalManufacturerId|intval}-brand_default.jpg"}

  <section class="ado-brand-header">
    <div class="ado-brand-header__inner">

      <div class="ado-brand-header__logo">
        <img src="{$brandLogo|escape:'html':'UTF-8'}" alt="{$manufacturer.name|escape:'html':'UTF-8'}" loading="eager"
          decoding="async">
      </div>

      <div class="ado-brand-header__content">
        <h1 class="ado-brand-header__title h2 mb-2">
          {$manufacturer.name}
        </h1>

        {if $manufacturer.short_description}
          <div class="ado-brand-header__description rich-text">
            {$manufacturer.short_description nofilter}
          </div>
        {/if}
      </div>

    </div>

    {if $manufacturer.description}
      <div class="ado-brand-header__body rich-text mt-4">
        {$manufacturer.description nofilter}
      </div>
    {/if}

  </section>
{/block}
