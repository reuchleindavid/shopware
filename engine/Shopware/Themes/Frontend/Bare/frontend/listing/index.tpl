{extends file='frontend/index/index.tpl'}

{block name='frontend_index_header'}
	{include file='frontend/listing/header.tpl'}
{/block}

{block name='frontend_index_content_left'}
    {include file='frontend/listing/sidebar.tpl'}
{/block}

{* Main content *}
{block name='frontend_index_content'}
	<div class="content listing--content">

		{* Banner *}
		{block name="frontend_listing_index_banner"}
			{include file='frontend/listing/banner.tpl'}
		{/block}

		{* Category headline *}
		{block name="frontend_listing_index_text"}
			{if !$hasEmotion && !$sSupplierInfo}
				{include file='frontend/listing/text.tpl'}
			{/if}
		{/block}

		{* Topseller *}
		{block name="frontend_listing_index_topseller"}
			{if !$hasEmotion && !$sSupplierInfo && {config name=topSellerActive}}
				{action module=widgets controller=listing action=top_seller sCategory=$sCategoryContent.id}
			{/if}
		{/block}

		{* Define all necessary template variables for the listing *}
		{block name="frontend_listing_index_layout_variables"}
			{if $showListing && !$sOffers}

				{* Count of available product pages *}
				{$pages = ceil($sNumberArticles / $criteria->getLimit())}

                {* Controller url for the found products counter *}
				{$countCtrlUrl = "{url module="widgets" controller="listing" action="listingCount" sCategory=$sCategoryContent.id fullPath}"}

				{* Layout for the product boxes *}
				{$productBoxLayout = 'basic'}

				{if $sCategoryContent.productBoxLayout !== null &&
				    $sCategoryContent.productBoxLayout !== 'extend'}
					{$productBoxLayout = $sCategoryContent.productBoxLayout}
				{/if}

			{/if}
		{/block}

		{* Listing *}
		{block name="frontend_listing_index_listing"}
			{include file='frontend/listing/listing.tpl'}

			{if $sCategoryContent.parent != 1 && ! $showListing && !$sSupplierInfo}

				{* Further products in the category *}
				{block name="frontend_listing_index_listing_further_products"}
					<div class="further-products">
						<a class="further-products--link" href="{url controller='cat' sPage=1 sCategory=$sCategoryContent.id}">
							{s name="ListingActionsOffersLink"}Weitere Artikel in dieser Kategorie{/s}
						</a>
					</div>
				{/block}
			{/if}
		{/block}

		{* Tagcloud *}
		{block name="frontend_listing_index_tagcloud"}
			{if {config name=show namespace=TagCloud }}
				{action module=widgets controller=listing action=tag_cloud sController=listing sCategory=$sCategoryContent.id}
			{/if}
		{/block}
	</div>
{/block}

{* Sidebar right *}
{block name='frontend_index_content_right'}{/block}