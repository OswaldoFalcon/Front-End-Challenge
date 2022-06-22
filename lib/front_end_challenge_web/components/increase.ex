defmodule FrontEndChallengeWeb.Components.Increase do
  @moduledoc """
  A Tree node that has the hierachy component generated 
  for the UI.
  """
  use Surface.LiveComponent
  import FrontEndChallengeWeb.Gettext
  data count, :integer, default: 0
  slot default, args: [:count]

  def render(assigns) do
    ~F"""
    <div>
      <p>
        <#slot :args={count: @count} />
      </p>
      <div>
        <button class="button is-info" :on-click="dec" disabled={@count == 0}>
          -
        </button>
        <button class="button is-info" :on-click="inc">
          +
        </button>
        <button class="button is-info" :on-click="reset">
          reset
        </button>
      </div>
    </div>
    """
  end

  def handle_event("inc", _value, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_event("dec", _value, socket) do
    {:noreply, update(socket, :count, &(&1 - 1))}
  end

  def handle_event("reset", _value, socket) do
    {:noreply, assign(socket, :count, 0)}
  end
end
