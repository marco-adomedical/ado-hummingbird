{$componentName = 'product-miniature'}

{block name='product_miniature_item'}
  <article class="{$componentName} js-{$componentName}" data-id-product="{$product.id_product}"
    data-id-product-attribute="{$product.id_product_attribute}">
    <div class="{$componentName}__inner">
      {block name='product_miniature_top'}
        <div class="{$componentName}__top">
          {include file='catalog/_partials/product-flags.tpl'}
          {include file='catalog/_partials/miniatures/product-image.tpl'}
          {include file='catalog/_partials/miniatures/product-quickview.tpl'}
        </div>
      {/block}

      {block name='product_miniature_bottom'}
        <div class="{$componentName}__bottom">
          <div class="{$componentName}__infos">
            {block name='product_name'}
              <a class="{$componentName}__title" href="{$product.url}"
                aria-label="{l s='View product %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Catalog'}">
                {$product.name}
              </a>
            {/block}

            {block name='product_variants'}
              {if $product.main_variants}
                <div class="{$componentName}__variants">
                  {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
                </div>
              {/if}
            {/block}

            {* ===================================
               H: ADO SALE MODE
               Mostra prezzo solo se consentito
               =================================== *}
            {if empty($product.ado_sale_mode_data) || $product.ado_sale_mode_data.can_show_price}
              {if $product.show_price}
                <div class="{$componentName}__prices">
                  {block name='product_price'}
                    {hook h='displayProductPriceBlock' product=$product type="before_price"}

                    <div class="{$componentName}__price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
                      {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
                      {if '' !== $smarty.capture.custom_price}
                        {$smarty.capture.custom_price nofilter}
                      {else}
                        {$product.price}
                      {/if}
                    </div>

                    {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                    {hook h='displayProductPriceBlock' product=$product type='weight'}
                  {/block}

                  {block name='product_discount_price'}
                    {if $product.show_price}
                      <div class="{$componentName}__discount-price">
                        {if $product.has_discount}
                          {hook h='displayProductPriceBlock' product=$product type="old_price"}

                          <span class="{$componentName}__regular-price" aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">
                            {$product.regular_price}
                          </span>
                        {/if}
                      </div>
                    {/if}
                  {/block}
                </div>
              {/if}
            {/if}

            {* ===================================
               H: ADO SALE MODE
               Messaggio sintetico / badge in listing
               =================================== *}
            {if !empty($product.ado_sale_mode_data)}
              {if $product.ado_sale_mode_data.is_discontinued}
                <div class="mt-2">
                  <span class="badge bg-secondary">{l s='Fuori commercio' d='Modules.Adosalemode.Shop'}</span>
                </div>
              {elseif !empty($product.ado_sale_mode_data.message)}
                <div class="small text-muted mt-2 ado-sale-mode-listing-message">
                  {$product.ado_sale_mode_data.message}
                </div>
              {/if}
            {/if}

            {block name='product_reviews'}
              {hook h='displayProductListReviews' product=$product}
            {/block}
          </div>

          <div class="{$componentName}__actions">
            {* ===================================
               H: ADO SALE MODE
               Add to cart solo se consentito
               =================================== *}
            {if (empty($product.ado_sale_mode_data) || $product.ado_sale_mode_data.can_add_to_cart) && $product.add_to_cart_url}
              <form class="{$componentName}__form" action="{$urls.pages.cart}" method="post">
                <input type="hidden" value="{$product.id_product}" name="id_product">
                <input type="hidden" name="token" value="{$static_token}">

                <div class="quantity-button js-quantity-button">
                  {*
                    H: Input quantità
                    Modifico include il componente:
                    templates/components/qty-input.tpl

                    Gli attributi passati al componente devono essere scalari
                    (NON usare interpolazioni tipo "{$...}" dentro l'array).
                  *}
                  {include
                          file='components/qty-input.tpl'
                          attributes=[
                            "id" => "quantity_wanted",
                            "class" => "form-control js-quantity-wanted",
                            "value" => $product.quantity_wanted,
                            "min" => $product.quantity_required
                          ]
                        }
                </div>

                <button data-button-action="add-to-cart" class="product-miniature__add btn btn-primary btn-square-icon"
                  aria-label="{l s='Add to cart %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Actions'}"
                  title="{l s='Add to cart %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Actions'}"
                  data-ps-ref="add-to-cart">
                  <i class="material-icons" aria-hidden="true">&#xe854;</i>
                  <span class="product-miniature__add-text">{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                </button>
              </form>

              {* ===================================
               H: ADO SALE MODE
               CTA dedicata se presente
               =================================== *}
            {elseif !empty($product.ado_sale_mode_data.cta_label) && !empty($product.ado_sale_mode_data.cta_url)}
              <a href="{$product.ado_sale_mode_data.cta_url}" class="product-miniature__details btn btn-outline-primary">
                {$product.ado_sale_mode_data.cta_label}
              </a>
            {else}
              <a href="{$product.url}" class="product-miniature__details btn btn-outline-primary"
                aria-label="{l s='View product %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Catalog'}">
                {l s='See details' d='Shop.Theme.Actions'}
              </a>
            {/if}
          </div>
        </div>
      {/block}
    </div>
  </article>
{/block}
