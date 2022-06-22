defmodule FrontEndChallengeWeb.Demo do
  use Surface.LiveView

  alias FrontEndChallengeWeb.Components.{Hero, MyButton, Increase}

  def render(assigns) do
    ~F"""
    <div>
      <Hero name="John Doe" subtitle="How are you?" color="info" />
    </div>
    <MyButton loading rounded>
      Change my style!
    </MyButton>

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
    <Increase id="count" />
    """
  end
end
