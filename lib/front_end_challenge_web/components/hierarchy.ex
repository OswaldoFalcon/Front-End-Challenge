  defmodule FrontEndChallengeWeb.Components.Hierarchy do
  @moduledoc """
  A Tree node that has the hierachy component generated 
  for the UI.
  """
  use Surface.Component

  @doc "The list of items to be rendered"
  prop items, :list, required: true

  def render(assigns) do
    ~F"""
    {#for person <- @items}
    <ul class="main">
      <li>
        {#if person.level < 2}
          <p>
            Role: {person.role}
          </p>
        {/if}
        <ul class="nested">
          <li>
            {#if person.level == 2}
              <p>
                Role: {person.role}
              </p>
            {/if}
            <ul class="nested">
              {#if person.level == 3}
                <p>
                  <li>
                    Role: {person.role}
                  </li>
                </p>
              {/if}
            </ul>
          </li>
        </ul>
      </li>
    </ul>
  {/for}
  
  {#for person <- @items}
    
  {#if person.level < 2}
    Role: {person.role}  
  {/if}

  {#if person.level == 2}
  <p>
  {#for dot <- 1..person.level*3}
  .
  {/for}
    Role: {person.role}
  </p>
  {/if}  

  {/for}

    """
  end

  def handle_event("open_form", _, socket) do
    {:noreply, socket}
  end
end
