{* H: AGGANCIO ADO SALE MODE
  - bottone acquisto
*}
{if empty($product.ado_sale_mode_data) || $product.ado_sale_mode_data.can_add_to_cart}
  <div class="ado-sale-mode-add-to-cart" data-ado-sale-mode-add-to-cart>
    {if !$configuration.is_catalog}
      <div class="product__add-to-cart-container product-add-to-cart js-product-add-to-cart">
        {block name='product_availability'}
          <div id="product-availability" class="product__availability js-product-availability"
            {if empty($product.availability_message) && empty($product.delivery_information)}hidden{/if}>
            {if !empty($product.availability_message)}
              {if $product.availability == 'in_stock'}
                {assign 'availability_icon' 'E5CA'}
                {assign 'availability_class' 'text-success'}
              {elseif $product.availability == 'available'}
                {assign 'availability_icon' 'E002'}
                {assign 'availability_class' 'text-warning'}
              {elseif $product.availability == 'last_remaining_items'}
                {assign 'availability_icon' 'E002'}
                {assign 'availability_class' 'text-warning'}
              {else}
                {assign 'availability_icon' 'E14B'}
                {assign 'availability_class' 'text-danger'}
              {/if}

              <div class="product__availability-status {$availability_class}" aria-live="off"
                data-ps-ref="product-availability">
                <i class="product__availability-icon material-icons rtl-no-flip">&#x{$availability_icon};</i>

                <div class="product__availability-messages">
                  <span class="visually-hidden">{l s='Product availability:' d='Shop.Theme.Global'}</span>
                  <span>{$product.availability_message}</span>

                  {if !empty($product.availability_submessage)}
                    <small class="d-block">{$product.availability_submessage}</small>
                  {/if}
                </div>
              </div>
            {/if}

            {block name='product_delivery_times'}
              {if !empty($product.delivery_information)}
                <div class="product__delivery-infos">{$product.delivery_information}</div>
              {/if}
            {/block}
          </div>
        {/block}

        {block name='product_quantity'}
          <div class="product__actions-qty-add product-quantity">
            <div class="product-actions__quantity product__quantity quantity-button js-quantity-button">
              {*
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

            <div class="product__add-to-cart add">
              <button class="product__add-to-cart-button btn btn-primary" data-button-action="add-to-cart" type="submit"
                {if !$product.add_to_cart_url}aria-disabled="true" disabled{/if} data-ps-ref="add-to-cart"
                aria-label="{l s='Add to cart %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Actions'}"
                title="{l s='Add to cart %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Actions'}">
                <i class="material-icons" aria-hidden="true">&#xE547;</i>
                {l s='Add to cart' d='Shop.Theme.Actions'}
              </button>
            </div>

            {capture name='product_actions'}{hook h='displayProductActions' product=$product}{/capture}
            {if $smarty.capture.product_actions}
              {$smarty.capture.product_actions nofilter}
            {/if}
          </div>
        {/block}

        {block name='product_minimal_quantity'}
          <div class="product__minimal-quantity product-minimal-quantity js-product-minimal-quantity"
            {if $product.minimal_quantity <= 1}hidden{/if}>
            {if $product.minimal_quantity > 1}
              <i class="material-icons" aria-hidden="true">&#xE88F;</i>
              {l
                        s='The minimum purchase order quantity for the product is %quantity%.'
                        d='Shop.Theme.Checkout'
                        sprintf=['%quantity%' => $product.minimal_quantity]
                      }
            {/if}
          </div>
        {/block}
      </div>
    {/if}
  </div>
{/if}

{* H: ADO SALE MODE
  - messaggio commerciale
*}
{if !empty($product.ado_sale_mode_data.message)}
  <div class="alert alert-secondary mt-3 ado-sale-mode-message" data-ado-sale-mode-message>
    {$product.ado_sale_mode_data.message}
  </div>
{/if}

{* - CTA dedicata *}
{if !empty($product.ado_sale_mode_data.cta_label) && !empty($product.ado_sale_mode_data.cta_url)}
  <div class="mt-3 ado-sale-mode-cta" data-ado-sale-mode-cta>
    <a href="{$product.ado_sale_mode_data.cta_url}" class="btn btn-outline-primary">
      {$product.ado_sale_mode_data.cta_label}
    </a>
  </div>
{/if}
