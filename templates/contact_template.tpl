
<div class="contact-wrapper media" id="contact-entry-wrapper-{{$contact.id}}" >

		{{* This is a wrapper for the contact picture and the dropdown menu with contact relating actions *}}
		<div class="contact-photo-wrapper dropdown pull-left" >
			<div class="contact-entry-photo mframe" id="contact-entry-photo-{{$contact.id}}" >

				<a class="dropdown-toggle" id="contact-photo-menu-{{$contact.id}}" type="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
					<div class="contact-photo-image-wrapper hidden-xs">
						<img class="contact-photo media-object xl" src="{{$contact.thumb}}" {{$contact.sparkle}} alt="{{$contact.name}}" />

						{{* Overlay background on hover the avatar picture *}}
						<div class="contact-photo-overlay">
							<span class="contact-photo-overlay-content xl"><i class="fa fa-angle-down"></i></span>
						</div>
					</div>

					{{* use a smaller picture on very small displays (e.g. mobiles) *}}
					<div class="contact-photo-image-wrapper hidden-lg hidden-md hidden-sm">
						<img class="contact-photo-xs media-object" src="{{$contact.thumb}}" {{$contact.sparkle}} alt="{{$contact.name}}" />

						{{* Overlay background on hover the avatar picture *}}
						<div class="contact-photo-overlay">
							<span class="contact-photo-overlay-content overlay-xs"><i class="fa fa-angle-down"></i></span>
						</div>
					</div>
				</a>


				{{if $contact.photo_menu}}
				<ul class="contact-photo-menu menu-popup dropdown-menu " id="contact-photo-menu-{{$contact.id}}" role="menu" aria-labelledby="contact-photo-menu-{{$contact.id}}">
					{{foreach $contact.photo_menu as $c}}
					{{if $c.2}}
					<li role="menuitem"><a target="redir" href="{{$c.1}}">{{$c.0}}</a></li>
					{{elseif $c.3}}
					<li role="menuitem"><a onclick="addToModal('{{$c.1}}')">{{$c.0}}</a></li>
					{{else}}
					<li role="menuitem"><a href="{{$c.1}}">{{$c.0}}</a></li>
					{{/if}}
					{{/foreach}}
				</ul>

				{{/if}}
			</div>

		</div>

		<div class="media-body">
			{{* The contact description (e.g. Name, Network, kind of connection and so on *}}
			<div class="contact-entry-desc">
				<div class="contact-entry-name" id="contact-entry-name-{{$contact.id}}" >
					<h4 class="media-heading">{{$contact.name}}
					{{if $contact.account_type}} <small class="contact-entry-details" id="contact-entry-accounttype-{{$contact.id}}">({{$contact.account_type}})</small>{{/if}}
					{{if $contact.account_type == 'Forum'}}<i class="fa fa-comments-o" aria-hidden="true"></i>{{/if}}
					{{* @todo this needs some changing in core because $contact.account_type contains a translated string which may notbe the same in every language *}}
					</h4>
				</div>
				{{if $contact.alt_text}}<div class="contact-entry-details" id="contact-entry-rel-{{$contact.id}}" >{{$contact.alt_text}}</div>{{/if}}
				{{if $contact.itemurl}}<div class="contact-entry-details" id="contact-entry-url-{{$contact.id}}" >{{$contact.itemurl}}</div>{{/if}}
				{{if $contact.tags}}<div class="contact-entry-details" id="contact-entry-tags-{{$contact.id}}" >{{$contact.tags}}</div>{{/if}}
				{{if $contact.details}}<div class="contact-entry-details" id="contact-entry-details-{{$contact.id}}" >{{$contact.details}}</div>{{/if}}
				{{if $contact.network}}<div class="contact-entry-details" id="contact-entry-network-{{$contact.id}}" >{{$contact.network}}</div>{{/if}}
			</div>

			{{* The checkbox to perform batch actions to these contacts (for batch actions have a look at contacts-template.tpl) *}}
			{{* if !$no_contacts_checkbox *}}
			{{if $multiselect}}
			<div class="checkbox contact-entry-checkbox pull-right">
				<input id="checkbox-{{$contact.id}}" type="checkbox" class="contact-select pull-right" name="contact_batch[]" value="{{$contact.id}}">
				<label for="checkbox-{{$contact.id}}"></label>
			</div>
			{{/if}}
		</div>

</div>

		
{{* the following part is a nearly a copy of the part above but it is modyfied for working with js.
We use this part to filter the contacts with jquery.textcomplete *}}
<div class="javascript-template" rel="contact-template" style="display: none">
	<div class="contact-wrapper media" id="contact-entry-wrapper-{$id}" >

			{{* This is a wrapper for the contact picture and the dropdown menu with contact relating actions *}}
			<div class="contact-photo-wrapper dropdown pull-left" >
				<div class="contact-entry-photo mframe" id="contact-entry-photo-{$id}" >

					<a class="dropdown-toggle" id="contact-photo-menu-{$id}" type="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
						<div class="contact-photo-image-wrapper hidden-xs">
							<img class="contact-photo media-object xl" src="{$thumb}" {11} alt="{$name}" />

							{{* Overlay background on hover the avatar picture *}}
							<div class="contact-photo-overlay">
								<span class="contact-photo-overlay-content xl"><i class="fa fa-angle-down"></i></span>
							</div>
						</div>

						{{* use a smaller picture on very small displays (e.g. mobiles) *}}
						<div class="contact-photo-image-wrapper hidden-lg hidden-md hidden-sm">
							<img class="contact-photo-xs media-object" src="{$thumb}" {11} alt="{$name}" />

							{{* Overlay background on hover the avatar picture *}}
							<div class="contact-photo-overlay">
								<span class="contact-photo-overlay-content overlay-xs"><i class="fa fa-angle-down"></i></span>
							</div>
						</div>
					</a>


					{if $photo_menu}
					<ul class="contact-photo-menu menu-popup dropdown-menu " id="contact-photo-menu-{$id}" role="menu" aria-labelledby="contact-photo-menu-{$id}">
						{foreach $photo_menu as $c}
						{if $c.2}
						<li role="menuitem"><a target="redir" href="{$c.1}">{$c.0}</a></li>
						{elseif $c.3}
						<li role="menuitem"><a onclick="addToModal('{$c.1}')">{$c.0}</a></li>
						{else}
						<li role="menuitem"><a href="{$c.1}">{$c.0}</a></li>
						{/if}
						{/foreach}
					</ul>

					{/if}
				</div>

			</div>

			<div class="media-body"> {{* @todo There is a bug with this class - the browser freezes if the screensize is to small - but only fith textcomplete*}}
				{{* The contact description (e.g. Name, Network, kind of connection and so on *}}
				<div class="contact-entry-desc">
					<div class="contact-entry-name" id="contact-entry-name-{$id}" >
						<h4 class="media-heading">{$name}
						{if $account_type} <small class="contact-entry-details" id="contact-entry-accounttype-{$id}">({$account_type})</small>{/if}
						{if $account_type == 'Forum'}<i class="fa fa-comments-o" aria-hidden="true"></i>{/if}
						{{* @todo this needs some changing in core because $contact.account_type contains a translated string which may notbe the same in every language *}}
						</h4>
					</div>
					{if $alt_text}<div class="contact-entry-details" id="contact-entry-rel-{$id}" >{$alt_text}</div>{/if}
					{if $itemurl}<div class="contact-entry-details" id="contact-entry-url-{$id}" >{$itemurl}</div>{/if}
					{if $tags}<div class="contact-entry-details" id="contact-entry-tags-{$id}" >{$tags}</div>{/if}
					{if $details}<div class="contact-entry-details" id="contact-entry-details-{$id}" >{$details}</div>{/if}
					{if $network}<div class="contact-entry-details" id="contact-entry-network-{$id}" >{$network}</div>{/if}
				</div>

				{{* The checkbox to perform batch actions to these contacts (for batch actions have a look at contacts-template.tpl) *}}
				{{* if !$no_contacts_checkbox *}}
				{{if $multiselect}}
				<div class="checkbox contact-entry-checkbox pull-right">
					<input id="checkbox-{$id}" type="checkbox" class="contact-select pull-right" name="contact_batch[]" value="{$id}">
					<label for="checkbox-{$id}"></label>
				</div>
				{{/if}}
			</div>

	</div>
</div>
