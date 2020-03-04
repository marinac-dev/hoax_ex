defmodule HoaxEx do
  alias HoaxEx.Person.Main, as: Person
  alias HoaxEx.Computer.Main, as: Computer

  @def_opts %{
    person: %{},
    pc: %{}
  }

  def generate_life(opts \\ @def_opts) do
    person = Person.generate(opts.person)
    computer = Computer.generate(opts.pc)
    Map.merge(person, %{computer: [computer]})
  end
end
