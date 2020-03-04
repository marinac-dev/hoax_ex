defmodule HoaxEx.Computer.Component.GPU do
  defstruct [:name, :memory, :clock_speed]
  @type t :: %__MODULE__{name: :string, memory: :integer, clock_speed: :integer}

  @def_opts %{name: "XiForce 1", memory: 256, clock_speed: 300}

  def generate(opts \\ @def_opts) do
    opts = Map.merge(@def_opts, opts)
    %__MODULE__{name: opts.name, memory: opts.memory, clock_speed: opts.clock_speed}
  end
end
