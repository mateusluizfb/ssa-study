defmodule PhiFunctionInsertion do
  def dominance_frontiers([node_list_head | node_list_tail], node, frontiers) do
    case Enum.member?(node_list_head[:node_childs], node) do
      true -> dominance_frontiers(node_list_tail, node, Enum.concat(frontiers, [node_list_head[:node_name]]))
      false -> dominance_frontiers(node_list_tail, node, Enum.concat(frontiers))
    end
  end

  def dominance_frontiers([], _node, frontiers) do
    frontiers
  end
end


result = PhiFunctionInsertion.dominance_frontiers(
  [
    %{ node_name: 'A', node_childs: ['Z'] },
    %{ node_name: 'B', node_childs: ['Z'] }
  ],
  'Z',
  []
)

IO.write result
