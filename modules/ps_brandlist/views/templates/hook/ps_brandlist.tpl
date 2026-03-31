{$componentName = 'search-filters-modules'}

<div id="search_filters_brands">
  <section class="{$componentName} facet">

    {*
      ===================================
      H: ADO CUSTOMIZATION
      ===================================

      In homepage nascondiamo il titolo del modulo
    *}
    {if $page.page_name != 'index'}
      {if $display_link_brand}
        <a href="{$page_link}" class="{$componentName}-title d-block mb-3" title="{l s='brands' d='Shop.Theme.Catalog'}">
          {l s='Brands' d='Shop.Theme.Catalog'}
        </a>
      {else}
        <p class="{$componentName}-title">
          {l s='Brands' d='Shop.Theme.Catalog'}
        </p>
      {/if}
    {/if}

    {*
      ===================================
      H: ADO CUSTOMIZATION
      ===================================

      Homepage → griglia custom
      Altrove → comportamento standard
    *}

    {if $brands}
      {if $page.page_name == 'index'}
        {include file='_partials/ado-brand_grid.tpl' brands=$brands}
      {else}
        {include file="module:ps_brandlist/views/templates/_partials/$brand_display_type.tpl" brands=$brands}
      {/if}
    {else}
      <p class="mb-0">{l s='No brand' d='Shop.Theme.Catalog'}</p>
    {/if}

  </section>
</div>
