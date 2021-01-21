{include file='header' pageTitle='gallery.acp.image.category.rights.copy'}

<script data-relocate="true">
	//<![CDATA[
	$(function() {
		WCF.TabMenu.init();

		// fieldset-fix for broken firefox
		if ($.browser.mozilla) {
			$('#general').find('fieldset').css('display', 'block');
		}
	});
	//]]>
</script>

<header class="boxHeadline">
	<h1>{lang}gallery.acp.image.category.rights.copy{/lang}</h1>
</header>

{include file='formError'}

{if $success|isset}
	<p class="success">{lang}wcf.global.success{/lang}</p>
{/if}

<form method="post" action="{link application='gallery' controller='CategoryRightsCopy'}{/link}">
	<div class="tabMenuContainer" data-active="{$activeTabMenuItem}" data-store="activeTabMenuItem">
		<nav class="tabMenu">
			<ul>
				<li><a href="{@$__wcf->getAnchor('general')}">{lang}gallery.acp.image.category.rights.copy{/lang}</a></li>
				{event name='tabMenuTabs'}
			</ul>
		</nav>

		<div id="general" class="container containerPadding tabMenuContent">
			<fieldset>
				{hascontent}
					<dl{if $errorField == 'sourceCategoryID'} class="formError"{/if}>
						<dt><label for="sourceCategoryID">{lang}gallery.acp.image.category.sourceCategoryID{/lang}</label></dt>
						<dd>
							<select name="sourceCategoryID" id="sourceCategoryID">
								{content}
									{foreach from=$categoryList item='category'}
										{assign var='categoryDepth' value=$categoryList->getDepth()}
										<option value="{@$category->categoryID}"{if $category->categoryID == $sourceCategoryID} selected="selected"{/if}>{@'&nbsp;&nbsp;&nbsp;&nbsp;'|str_repeat:$categoryDepth}{$category->title|language}</option>
									{/foreach}
								{/content}
							</select>
							{if $errorField == 'sourceCategoryID'}
								<small class="innerError">
									{lang}gallery.acp.image.category.sourceCategoryID.error.{@$errorType}{/lang}
								</small>
							{/if}
						</dd>
					</dl>
				{/hascontent}

				{hascontent}
					<dl {if $errorField == 'targetCategoryIDs'} class="formError"{/if}>
					    <dt><label for="targetCategoryIDs">{lang}gallery.acp.image.category.targetCategoryIDs{/lang}</label></dt>
					    <dd>
					        <select id="targetCategoryIDs" name="targetCategoryIDs[]" multiple="multiple" size="10">
					        	{content}
								{foreach from=$categoryList item=category}
									{assign var='categoryDepth' value=$categoryList->getDepth()}
									<option value="{@$category->categoryID}">{@'&nbsp;&nbsp;&nbsp;&nbsp;'|str_repeat:$categoryDepth}{$category->title|language}</option>
								{/foreach}
								{/content}
					        </select>
					        <small>{lang}wcf.global.multiSelect{/lang}</small>
							{if $errorField == 'targetGroupIDs'}
								<small class="innerError">
									{lang}gallery.acp.image.category.targetCategoryID.error.{@$errorType}{/lang}
								</small>
							{/if}
					    </dd>
					</dl>
				{/hascontent}
			</fieldset>

			{event name='generalFieldsets'}
		</div>

		{event name='tabMenuContents'}
	</div>

	<div class="formSubmit">
		<input type="submit" value="{lang}gallery.acp.image.category.copy{/lang}" accesskey="s" />
		{@SECURITY_TOKEN_INPUT_TAG}
	</div>
</form>

{include file='footer'}
