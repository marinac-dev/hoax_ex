defmodule HoaxEx.Computer.Main do
  alias HoaxEx.Computer.Component.{CPU, GPU, RAM}
  defstruct [:cpu, :gpu, :ram]

  @type t :: %__MODULE__{cpu: CPU, gpu: GPU, ram: RAM}

  @pc_tiers %{
    low: %{ram: 1..4, cpu: 1..2, gpu: {1..1, :low}},
    mid: %{ram: 4..8, cpu: 2..4, gpu: {1..1, :mid}},
    high: %{ram: 8..16, cpu: 4..8, gpu: {1..2, [:mid, :high]}},
    workstation: %{ram: 16..32, cpu: 8..16, gpu: {1..2, [:high]}},
    # Multiple CPUs rack
    s_server: %{ram: 32..64, cpu: 16..32, gpu: {2..4, [:mid, :high]}},
    m_server: %{ram: 64..128, cpu: 32..64, gpu: {4..8, [:high]}},
    l_server: %{ram: 128..512, cpu: 64..128, gpu: {16, [:high, :super]}},
    supercomputer: %{ram: 512..512_000, cpu: 128..1_024, gpu: {16..512, [:super]}}
  }
  @def_opts %{cpu: %{tier: :low}, gpu: %{}, ram: %{}}

  def generate(opts \\ @def_opts) do
    opts = Map.merge(@def_opts, opts)

    if Map.has_key?(@pc_tiers, opts.cpu.tier),
      do: generate(opts, :ok),
      else: raise("Cpu tier invalid!")
  end

  def generate(opts, :ok) do
    cpu = CPU.generate(opts.cpu)
    gpu = GPU.generate(opts.gpu)
    ram = RAM.generate(opts.ram)

    {:pc, %{cpu: cpu, gpu: gpu, ram: ram}}
  end
end
