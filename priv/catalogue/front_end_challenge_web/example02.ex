defmodule FrontEndChallengeWeb.Components.Hero.Example02 do
  @moduledoc """
  Example using the `color` property.
  """

  use Surface.Catalogue.Example,
    subject: FrontEndChallengeWeb.Components.Hero,
    height: "700px",
    title: "Colors"

  alias FrontEndChallengeWeb.Components.Hero

  def render(assigns) do
    ~F"""
    <Hero
      name="John Doe"
      subtitle="How are you?"
      color="info"
      id="info"
    />
    <Hero
      name="John Doe"
      subtitle="How are you?"
      color="warning"
      id="warning"
    />
    <Hero
      name="John Doe"
      subtitle="How are you?"
      color="danger"
      id="danger"
    />
    """
  end
end
