defmodule HoaxEx.Computer.Component.RAM do
  defstruct [:name, :memory, :clock_speed]
  @type t :: %__MODULE__{name: :string, memory: :integer, clock_speed: :integer}

  @def_opts %{name: "MemDroid 1", memory: 512, clock_speed: 500}

  def generate(opts \\ @def_opts) do
    opts = Map.merge(@def_opts, opts)
    %__MODULE__{name: opts.name, memory: opts.memory, clock_speed: opts.clock_speed}
  end
end
