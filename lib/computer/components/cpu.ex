defmodule HoaxEx.Computer.Component.CPU do
  defstruct [:name, :cores, :threads, :ghz, :price]

  @type t :: %__MODULE__{
          name: :string,
          cores: :integer,
          threads: :integer,
          ghz: :integer,
          price: :integer
        }

  @def_opts %{name: "iPemtium 1", cores: 1, threads: 1, ghz: 800, price: 50}
  # Low to Mid tier cpu
  @cpu1 %{name: "iPemtium 1", cores: 1, threads: 1, ghz: 2400, price: 50}
  @cpu2 %{name: "iPemtium 2", cores: 2, threads: 2, ghz: 1800, price: 100}
  @cpu3 %{name: "iPemtium 3", cores: 2, threads: 4, ghz: 1900, price: 200}
  @cpu4 %{name: "iPemtium 4", cores: 4, threads: 8, ghz: 2000, price: 400}
  # Mid to High tier cpu
  @cpu5 %{name: "AMB Rizen 3", cores: 4, threads: 4, ghz: 2200, price: 800}
  @cpu6 %{name: "Imtel i3", cores: 4, threads: 6, ghz: 2000, price: 850}
  @cpu7 %{name: "AMB Rizen 5", cores: 8, threads: 16, ghz: 2800, price: 1600}
  @cpu8 %{name: "Imtel i5", cores: 8, threads: 8, ghz: 3200, price: 1750}
  # High tier cpu
  @cpu9 %{name: "AMB Rizen 7", cores: 12, threads: 16, ghz: 4500, price: 3200}
  @cpu10 %{name: "Imtel i7", cores: 8, threads: 16, ghz: 4600, price: 3700}
  @cpu11 %{name: "AMB Rizen 9", cores: 16, threads: 32, ghz: 3900, price: 6400}
  @cpu12 %{name: "Imtel i9", cores: 12, threads: 24, ghz: 4200, price: 7800}

  # Server grade tier cpu

  def generate(opts \\ @cpu1) do
    opts = Map.merge(@cpu1, opts)
    struct(__MODULE__, opts)
  end
end
