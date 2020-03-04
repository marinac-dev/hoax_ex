defmodule HoaxEx.Person do
  alias HoaxEx.Person.{Name, Lastname, State}
  @def_opts %{sex: :r, name: :r, lastname: :r, age: :r}

  def generate(opts \\ %{}) do
    opts = Map.merge(@def_opts, opts)
    [name, sex] = get_name(opts.name, opts.sex)
    lastname = get_lastname()
    age = Enum.random(18..20)
    {s_id, state} = State.get()
    id = get_id(s_id)

    %{
      name: name,
      lastname: lastname,
      sex: sex,
      age: age,
      personal_id: id,
      state: state
    }
  end

  defp get_name(:r, :r),
    do: if(Enum.random(0..1) == 0, do: get_name(:r, :f), else: get_name(:r, :m))

  defp get_name(:r, :m), do: [Name.male(), :m]
  defp get_name(:r, :f), do: [Name.female(), :f]
  defp get_name(custom, :m), do: [custom, :m]
  defp get_name(custom, :f), do: [custom, :f]
  defp get_lastname(), do: Lastname.get()

  defp get_id(state) do
    part1 = :crypto.strong_rand_bytes(2) |> Base.encode16()
    part2 = :crypto.strong_rand_bytes(6) |> Base.encode16()
    part3 = :crypto.strong_rand_bytes(8) |> Base.encode16()

    "#{state}-#{part1}:#{part2}:#{part3}"
  end
end
