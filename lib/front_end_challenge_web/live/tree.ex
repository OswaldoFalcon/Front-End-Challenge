defmodule FrontEndChallengeWeb.Tree do
  use Surface.LiveView

  alias FrontEndChallengeWeb.Components.{Hierarchy, MyButton}
  alias Surface.Components.Form
  alias Surface.Components.Form.Select

  data department, :list,
    default: [
      %{role: "manager A", warrant: "300", level: 1},
      %{role: "manager B", warrant: "300", level: 2},
      %{role: "developer", warrant: "1000", level: 3},
      %{role: "QA tester", warrant: "800", level: 3}
    ]

  def render(assigns) do
    ~F"""
    <Hierarchy items={@department}/>
    <div class="select">
      <Select
        form="Department"
        field="role"
        options={
          Manager: "manager",
          Developer: "user",
          "QA Tester": "qa_tester"
        }
      />
    </div>
    <MyButton>
      Hola
    </MyButton>
    
    """
  end
end
