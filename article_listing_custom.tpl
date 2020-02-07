{extends file='parent:frontend/listing/index.tpl'}

{* Wrap the content into a new element *}
{block name='frontend_index_content'}

	{function name="sub_box" cat=0}
		<div class="subcat-wrap">
			<a href="{$cat.link}">
				<div class="img-wrap">
					{if $cat.media} 
						{* Show Picture *}
						<img src="{$cat.media.path}" alt="{$cat.media.name}" />                                        
					{else}
						{* Show No Picture *}
						<img class="no-img" src="/themes/Frontend/Responsive/frontend/_public/src/img/no-picture.jpg" alt="no IMage">
					{/if}
				</div>
				<div class="name-wrap">
					<p>{$cat.name}</p>
				</div>
			</a>
		</div>
	{/function}

	{function name="go_down" mainCat=0}
		{foreach $mainCat as $main}
			{if $main.id === $sCategoryContent.id} 
				{* Render Box *}
				{foreach $main.subcategories as $sub}
						{call name="sub_box" cat=$sub}   
				{/foreach}
			{else}
				{* Loop again *}
				{call name="go_down" mainCat=$main.subcategories }   
			{/if}
		{/foreach}
	{/function}


	{if $sCategoryContent.media.path}
		<div class="cat-header-img">
			<img 
				srcset="{foreach $sCategoryContent.media.thumbnails as $set}
										{$set.source} {$set.maxWidth}w,
								{/foreach}"
				src="{$sCategoryContent.media.path}" 
			/>
		</div>
	{/if}

	<h1>{$sCategoryContent.name}</h1>
		
	<div class="meta-desc">
		<p>{$sCategoryContent.cmstext}</p>
	</div>

	<div class="sub-cat-list-wrap mg-bottom-md">
		{call name="go_down" mainCat=$sMainCategories }  
	</div>

{/block}
