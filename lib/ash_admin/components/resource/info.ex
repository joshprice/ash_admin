defmodule AshAdmin.Components.Resource.Info do
  @moduledoc false
  use Surface.Component

  alias AshAdmin.Components.Resource.{AttributeTable, RelationshipTable}

  prop(resource, :any, required: true)
  prop(api, :any, required: true)
  prop(prefix, :any, required: true)

  def render(assigns) do
    ~F"""
    <div class="relative mx-12">
      <AttributeTable resource={@resource} />
      <RelationshipTable api={@api} resource={@resource} prefix={@prefix} />

      <section phx-hook="Mermaid">
        <h1 class="text-3xl rounded-t py-8">
          Entity Relationship Diagram (Mermaid)
        </h1>
        <pre class="mermaid">
          {Ash.Api.Info.Diagram.mermaid_er_diagram(@api)}
        </pre>
      </section>
    </div>
    """
  end
end
