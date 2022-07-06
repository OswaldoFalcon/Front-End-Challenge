defmodule FrontEndChallengeWeb.Demo do
  @moduledoc """
  This is the demo Module
  """
  use Surface.LiveView

  alias FrontEndChallengeWeb.Components.{Hero, Increase}

  data message, :string, default: "Waiting for message"

  def render(assigns) do
    ~F"""
    <div>
      <Hero name="John Doe" subtitle="How are you?" color="info" message={@message} id="component" />
    </div>

    <ul id="myUL">
      <li><span class="caret">Manager A</span>
        <ul class="nested">
          <li><span class="caret">Manger B</span>
            <ul class="nested">
              <li>Developer</li>
              <li>QA Tester</li>
            </ul>
          </li>
        </ul>
      </li>
    </ul>
    <br>
    <Increase id="count" />
    <br>
    <br> New message {@message}
    """
  end

  def handle_info({:message, new_message}, socket) do
    {:noreply,
     assign(socket,
       message: new_message
     )}
  end
end
