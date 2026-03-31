  {*
    ===================================
    H: PRODUCT
    ===================================

    PDP:
    - aggiunta reference sotto al titolo
    - sezione tabs resa full width
    - rimossa colonna laterale reassurance
    - rimossi Commenti
    - logica listing:
      1. correlati
      2. fallback stessa categoria
      3. prodotti visitati
  *}

  {extends file=$layout}

  {block name='head' append}
    <meta property="og:type" content="product">
    <meta property="og:url" content="{$product.url}">

    {if $product.cover}
      <meta property="og:image" content="{$product.cover.large.url}">
    {/if}

    {if $product.show_price}
      <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
      <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
      <meta property="product:price:amount" content="{$product.price_amount}">
      <meta property="product:price:currency" content="{$currency.iso_code}">
    {/if}

    {if isset($product.weight) && ($product.weight != 0)}
      <meta property="product:weight:value" content="{$product.weight}">
      <meta property="product:weight:units" content="{$product.weight_unit}">
    {/if}
  {/block}

  {block name='head_microdata_special'}
    {include file='_partials/microdata/product-jsonld.tpl'}
  {/block}

  {block name='content'}

    {* H: FIRST PART
    - PHOTO, NAME, PRICES, ADD TO CART
  *}
    <div class="product__container product-container js-product-container" data-ps-ref="product-container">
      <div class="product__left">
        {block name='product_cover_thumbnails'}
          {include file='catalog/_partials/product-cover-thumbnails.tpl'}
        {/block}
      </div>

      <div class="product__right" data-ps-ref="product-right" tabindex="-1">
        {block name='product_header'}
          <h1 class="product__name h2 {if !empty($product_manufacturer->name) || !empty($product.reference)}mb-1{/if}">
            {block name='page_title'}{$product.name}{/block}
          </h1>
        {/block}

        {block name='product_manufacturer'}
          {if !empty($product_manufacturer->name) || !empty($product.reference)}
            <div class="product__manufacturer">
              {if !empty($product_manufacturer->name)}
                {if !empty($product_manufacturer->url)}
                  <a href="{$product_manufacturer->url}"
                    aria-label="{l s='Product brand: %brand_name%' sprintf=['%brand_name%' => $product_manufacturer->name] d='Shop.Theme.Catalog'}">
                    {$product_manufacturer->name}
                  </a>
                {else}
                  <span>{$product_manufacturer->name}</span>
                {/if}
              {/if}

              {if !empty($product_manufacturer->name) && !empty($product.reference)}
                <span class="product__manufacturer-separator">·</span>
              {/if}

              {if !empty($product.reference)}
                <span class="product__reference">
                  {l s='Ref:' d='Shop.Theme.Catalog'} {$product.reference}
                </span>
              {/if}
            </div>
          {/if}
        {/block}

        {* discontinued notice *}
        {if !empty($product.ado_sale_mode_data) && $product.ado_sale_mode_data.is_discontinued}
          <div class="alert alert-warning mt-3 ado-sale-mode-discontinued-notice">
            <strong>{l s='Prodotto non più disponibile.' d='Modules.Adosalemode.Shop'}</strong><br>
            {l s='Valuta le alternative disponibili qui sotto.' d='Modules.Adosalemode.Shop'}
          </div>
        {/if}

        {block name='product_prices'}
          {include file='catalog/_partials/product-prices.tpl'}
        {/block}

        {block name='product_description_short'}
          <div class="product__description-short rich-text">{$product.description_short nofilter}</div>
        {/block}

        {block name='product_customization'}
          {if $product.is_customizable && count($product.customizations.fields)}
            {include file='catalog/_partials/product-customization.tpl' customizations=$product.customizations}
          {/if}
        {/block}

        <div class="product__actions js-product-actions">
          {block name='product_buy'}
            <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
              <input type="hidden" name="token" value="{$static_token}">
              <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
              <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id"
                class="js-product-customization-id">

              {block name='product_variants'}
                {include file='catalog/_partials/product-variants.tpl'}
              {/block}

              {block name='product_pack'}
                {include file='catalog/_partials/product-pack.tpl'}
              {/block}

              {block name='product_discounts'}
                {include file='catalog/_partials/product-discounts.tpl'}
              {/block}

              {block name='product_add_to_cart'}
                {include file='catalog/_partials/product-add-to-cart.tpl'}
              {/block}

              {block name='product_additional_info'}
                {include file='catalog/_partials/product-additional-info.tpl'}
              {/block}

              {block name='product_out_of_stock'}
                {hook h='actionProductOutOfStock' product=$product}
              {/block}

              {* Input to refresh product HTML removed, block kept for compatibility with themes *}
              {block name='product_refresh'}{/block}
            </form>
          {/block}
        </div>
      </div>
    </div>
    {* END OF FIRST PART *}

    {* H: SECOND PART
    - TABS FULL WIDTH
  *}
    <div class="product__bottom mb-5">
      {* descrizione attenuata per discontinued *}
      <div
        class="ado-product-description-wrapper{if !empty($product.ado_sale_mode_data) && $product.ado_sale_mode_data.is_discontinued} ado-product-description-wrapper--discontinued{/if}">
        {block name='product_tabs'}
          <div class="product__accordion accordion accordion-flush" id="product_accordion">
            {block name='product_description'}
              {if $product.description}
                <div class="accordion-item" id="product_description">
                  <h2 class="accordion-header" id="product_description_heading">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                      data-bs-target="#product_description_collapse" aria-expanded="true"
                      aria-controls="product_description_collapse">
                      {l s='Description' d='Shop.Theme.Catalog'}
                    </button>
                  </h2>

                  <div id="product_description_collapse" class="accordion-collapse collapse show"
                    aria-labelledby="product_description_heading">
                    <div class="accordion-body">
                      <div class="product__description rich-text">
                        {$product.description nofilter}
                      </div>
                    </div>
                  </div>
                </div>
              {/if}
            {/block}

            {block name='product_details'}
              {include file='catalog/_partials/product-details.tpl'}
            {/block}

            {block name='product_attachments'}
              {if $product.attachments}
                <div class="info accordion-item" id="product_attachments">
                  <h2 class="accordion-header" id="product_attachments_heading">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                      data-bs-target="#product_attachments_collapse" aria-expanded="false"
                      aria-controls="product_attachments_collapse">
                      {l s='Download' d='Shop.Theme.Actions'}
                    </button>
                  </h2>

                  <div id="product_attachments_collapse" class="accordion-collapse collapse"
                    aria-labelledby="product_attachments_heading">
                    <div class="accordion-body">
                      <div class="product__attachments">
                        {foreach from=$product.attachments item=attachment}
                          <div class="attachment">
                            <p class="attachment__name">
                              {$attachment.name}
                            </p>

                            {if $attachment.description}
                              <p class="attachment__description">
                                {$attachment.description}
                              </p>
                            {/if}

                            {assign var='attachmentExt' value=$attachment.file_name|lower|regex_replace:'/^.*\.([a-z0-9]+)$/':'$1'}

                            <a class="attachment__link stretched-link"
                              href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}"
                              {if $attachmentExt == 'pdf'}target="_blank" rel="noopener noreferrer" {/if}
                              aria-label="{l s='Download %attachment_name%' sprintf=['%attachment_name%' => $attachment.name] d='Shop.Theme.Actions'}">
                              <i class="material-icons">&#xE2C4;</i>
                              {l s='Download' d='Shop.Theme.Actions'}
                              ({$attachment.file_size_formatted})
                            </a>
                          </div>
                        {/foreach}
                      </div>
                    </div>
                  </div>
                </div>
              {/if}
            {/block}

            {* Extra content modules - skip product comments *}
            {foreach from=$product.extraContent item=extra key=extraKey}
              {if (!isset($extra.moduleName) || $extra.moduleName != 'productcomments')
                    && (!isset($extra.title) || $extra.title != 'Comments')}

              <div class="accordion-item" id="extra_{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"
                {/foreach}>
                <h2 class="accordion-header" id="product_extra_{$extraKey}_heading">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#product_extra_{$extraKey}_collapse" aria-expanded="false"
                    aria-controls="product_extra_{$extraKey}_collapse">
                    {$extra.title}
                  </button>
                </h2>

                <div id="product_extra_{$extraKey}_collapse" class="accordion-collapse collapse"
                  data-bs-parent="#product_accordion" aria-labelledby="product_extra_{$extraKey}_heading">
                  <div class="accordion-body">
                    {$extra.content nofilter}
                  </div>
                </div>
              </div>

            {/if}
          {/foreach}
        </div>
      {/block}
    </div>
  </div>
  {* END OF SECOND PART *}

  {* H: THIRD PART
    - PRODUCT LISTINGS
  *}
  <section id="ado-alternatives">
    {* 1. Related products, fallback to same category *}
    {if $accessories}
      {block name='product_accessories'}
        {include file='catalog/_partials/product-accessories.tpl'}
      {/block}
    {else}
      {block name='product_same_category'}
        {hook h='displayFooterProduct' product=$product category=$category mod='ps_categoryproducts'}
      {/block}
    {/if}
  </section>

  {* 2. Viewed products always shown if module returns content *}
  {block name='product_viewed'}
    {hook h='displayFooterProduct' product=$product category=$category mod='ps_viewedproduct'}
  {/block}

  {block name='ado_sale_mode'}
    {hook h='displayFooterProduct' product=$product category=$category mod='ado_sale_mode'}

    {* H: Fallback temporaneo.
       Se il modulo registra già correttamente il suo JS, questa riga va rimossa. *}
    <script src="/modules/ado_sale_mode/views/js/front.js?v=20260327-6"></script>
  {/block}

  {block name='page_footer_container'}
    {block name='page_footer'}{/block}
  {/block}
{/block}
