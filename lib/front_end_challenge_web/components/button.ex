defmodule FrontEndChallengeWeb.Components.MyButton do
  use Surface.Component

  prop loading, :boolean
  prop rounded, :boolean
  prop click, :event

  slot default

  def render(assigns) do
    ~F"""
    <button
      class={"button", "is-info", "is-loading": @loading, "is-rounded": @rounded}
      :on-click={@click}
    >
      <#slot />
    </button>
    """
  end
end