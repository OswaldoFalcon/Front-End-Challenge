defmodule FrontEndChallengeWeb.Components.MyGraph do
  @moduledoc """
  This is the MyGraph Module
  This is the Core of the UI
  Display the Components in a hierarchical way
  """
  use Surface.LiveComponent
  alias FrontEndChallenge.TreeGraph

  prop loading, :boolean
  prop rounded, :boolean

  prop click, :event

  slot default

  data allocation, :integer, default: 0
  prop employees, :list
  prop graph, :struct
  prop vertex, :list
  data curret_role, :atom

  ## obtener lista de los veertices usados, para ya no usarlos

  def render(assigns) do
    ~F"""
    <div>
      <h1>
        Root Manager
      </h1>
      <div>
        {#for v <- @vertex}
          {Graph.vertex_labels(@graph, v) |> List.first() |> Atom.to_string()} id: {v} <button class="button is-info" :on-click="add" phx-value-role="developer" phx-value-parent_id={v}>
            Developer
          </button>
          <button class="button is-info" :on-click="add" phx-value-role="qa_tester" phx-value-parent_id={v}>
            QA Testert
          </button>
          <button class="button is-danger" :on-click="delete" phx-value-vertex={v} phx-value-role="manager">
            delete
          </button>
          <br><br>
          {#for child <- Graph.in_neighbors(@graph, v)}
            {TreeGraph.label_vertex(@graph, child)} id: {child}
            <button
              class="button is-danger"
              :on-click="delete"
              phx-value-vertex={child}
              phx-value-role={@curret_role}
            >
              delete
            </button>
            <br>
          {#else}
          {/for}
        {/for}
      </div>
      <button class={"button", "is-info"} :on-click="add_manager">
        add manager
      </button>

      <h1>
        Total Allocation : {@allocation}
      </h1>
    </div>
    """
  end

  def handle_event("add_manager", _, socket) do
    employees = TreeGraph.add_employee(socket.assigns.employees, 0, :manager)
    vertex = TreeGraph.get_manager_vertex(employees) |> List.last()
    manager_vertex = socket.assigns.vertex ++ [vertex]
    graph = TreeGraph.build_graph(employees)
    allocation = socket.assigns.allocation + 500

    {:noreply,
     assign(socket,
       employees: employees,
       vertex: manager_vertex,
       graph: graph,
       allocation: allocation
     )}
  end

  def handle_event("add", %{"role" => role, "parent_id" => parent_id}, socket) do
    role = String.to_atom(role)
    parent_id = String.to_integer(parent_id)
    employees = TreeGraph.add_employee(socket.assigns.employees, parent_id, role)
    graph = TreeGraph.build_graph(employees)

    allocation =
      cond do
        role == :developer -> socket.assigns.allocation + 1000
        role == :qa_tester -> socket.assigns.allocation + 500
        true -> socket.assigns.allocation + 0
      end

    {:noreply,
     assign(socket,
       employees: employees,
       graph: graph,
       allocation: allocation,
       curret_role: role
     )}
  end

  def handle_event("delete", %{"vertex" => vertex}, socket) do
    vertex = String.to_integer(vertex)
    vertexes = List.delete(socket.assigns.vertex, vertex)
    employees = TreeGraph.delete_employees(socket.assigns.graph, socket.assigns.employees, vertex)
    graph = TreeGraph.build_graph(employees)

    allocation = TreeGraph.total_allocation(graph)

    {:noreply,
     assign(socket,
       employees: employees,
       graph: graph,
       allocation: allocation,
       vertex: vertexes
     )}
  end
end
