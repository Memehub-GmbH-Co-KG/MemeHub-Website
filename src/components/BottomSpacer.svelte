<script>
    import { user } from "../user.js";
</script>

<style>
    div {
        color: var(--color-primary);
        background-color: var(--color-secondary);

        margin: 3em 0 0;
        padding: 2em 2em 7em;
        font-size: 1.2em;
        min-height: 50%;
        text-align: center;
    }
    hr {
        border: 1px solid var(--color-primary);
    }
</style>

<div>
    <h2>How it works</h2>
    <p>
        You can choose to vote for one meme from each category. The ones
        receiving the most votes will be the winner of this years MemeHub
        Awards.
    </p>
    <h2>Which memes have been nominated?</h2>
    <p>
        This year we have looked at more than 500 of your best memes and put them
        into categories.
    </p>
    <hr />
    <p>
        {#if $user.loading}Loading userdata...{:else}User: {$user.name}{/if}
    </p>
</div>
