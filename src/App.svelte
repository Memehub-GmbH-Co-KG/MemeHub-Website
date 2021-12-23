<script>
	import Banner from "./components/Banner.svelte";
	import Category from "./components/Category.svelte";
	import BottomSpacer from "./components/BottomSpacer.svelte";
	import VoteCount from "./components/VoteCount.svelte";
	import { nominees } from "./nominees.js";
	import { user } from "./user.js";

	$: categories = Object.keys($nominees);
	$: text = $user.loading
		? "Loading..."
		: $user.invalidToken
		? "Invalid token!"
		: $user.noConnection
		? "No connection"
		: "Vote for your favorite Memes!";
</script>

<style>
	:global(:root) {
		--color-primary: #4a1c1c;
		--color-primary-variant: #2b0b0b;
		--color-secondary: #ce9f76;
		--color-secondary-variant: #c1b6ac;
	}
	:global(body) {
		background-color: var(--color-primary);
		padding: 0;
		font-family: "Hind", sans-serif;
	}
	p {
		color: var(--color-secondary);

		margin: 0;
		padding: 1em 1em;
		font-size: 1.2em;
		text-align: center;
		font-size: 1.3em;
	}
	a {
		color: var(--color-secondary-variant);
	}
	form {
		margin: 0 auto;
		max-width: 50em;
		padding: 1em 2em;
		display: flex;
		align-content: stretch;
	}
	input[type="text"] {
		width: 100%;
		margin: 0;
		background-color: transparent;
		color: var(--color-secondary);
		border: 0.3em solid var(--color-secondary);
	}
	input[type="submit"] {
		color: var(--color-primary);
		background-color: var(--color-secondary);
		border: 0.3em solid var(--color-secondary);
		margin: 0 0 0 1em;
	}
	#spinner {
		display: block;
		margin: 3em auto 0;
		height: 4em;
		width: 4em;
		border: 0.4em transparent solid;
		border-top: 0.4em solid var(--color-secondary);
		border-radius: 50%;
		-webkit-animation: spin2 1s infinite linear;
		animation: spin2 1s infinite linear;
	}

	@-webkit-keyframes spin2 {
		from {
			-webkit-transform: rotate(0deg);
			transform: rotate(0deg);
		}
		to {
			-webkit-transform: rotate(359deg);
			transform: rotate(359deg);
		}
	}

	@keyframes spin2 {
		from {
			-webkit-transform: rotate(0deg);
			transform: rotate(0deg);
			-webkit-transform: rotate(0deg);
			transform: rotate(0deg);
		}
		to {
			-webkit-transform: rotate(359deg);
			transform: rotate(359deg);
			-webkit-transform: rotate(359deg);
			transform: rotate(359deg);
		}
	}
</style>

<Banner {text} />

{#if $user.loading}
	<div id="spinner" />
{:else if $user.invalidToken}
	<p>
		You need a valid token in order to vote. Please check your messages from
		<a href="https://t.me/ToMemeHub_Bot">@ToMemeHub_Bot</a>
	</p>
	<p>You can also enter your token here:</p>
	<form action="/" method="GET">
		<input type="text" name="token" />
		<input type="submit" value="Use" />
	</form>
{:else if $user.noConnection}
	<p>
		We are currently experiencing technical difficulties. Plase try again
		later.
	</p>
{:else}
	{#each categories as category}
		<Category {category} />
	{/each}
	<VoteCount />
{/if}
<BottomSpacer />
