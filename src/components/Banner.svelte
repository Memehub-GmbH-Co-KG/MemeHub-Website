<script>
    import InfoText from "./InfoText.svelte";

    export let text;
</script>

<style>
    h1 {
        background-color: var(--color-secondary);
        color: var(--color-primary);
        text-align: right;
        font-family: "Teko", sans-serif;
        font-size: 8em;
        font-stretch: narrower;
        font-weight: 300;
        line-height: 0.8em;
        letter-spacing: 0em;

        margin: 0.2em 0 0em;

        padding: 0.1em 2% 0;
    }
</style>

<h1>MemeHub Awards 2021</h1>
<InfoText {text} />
