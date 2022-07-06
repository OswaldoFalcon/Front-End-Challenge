defmodule FrontEndChallengeWeb.Components.Total do
  @moduledoc """
  A sample component to show the total allocation
  """
  use Surface.Component

  slot default, required: true

  def render(assigns) do
    ~F"""
    <div class="containers total">
      💸 <#slot name="default" /> 💸
    </div>
    """
  end
end
