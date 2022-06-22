defmodule FrontEndChallengeWeb.Components.Hero.Example01 do
  @moduledoc """
  Example using the `name` and `subtitle` properties.
  """

  use Surface.Catalogue.Example,
    subject: FrontEndChallengeWeb.Components.Hero,
    height: "480px",
    title: "Name & Subtitle"

  alias FrontEndChallengeWeb.Components.Hero

  def render(assigns) do
    ~F"""
    <Hero subtitle="How are you?"/>
    <Hero
      name="John Doe"
      subtitle="Welcome to Surface!"
    />
    """
  end
end
