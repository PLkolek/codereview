class TreeCleaner
  #Assumes the root cannot be deleted
  def self.clean_tree(root_node)
    (remove_not_my_nodes root_node).first
  end

private
  def self.remove_not_my_nodes(node)
    if node.class.name != "Treetop::Runtime::SyntaxNode"
      node.elements.replace clean_children(node)
      [node]
    else
      clean_children(node)
    end
  end

  def self.clean_children(node)
    node.elements.to_a.map { |n| remove_not_my_nodes n }.flatten
  end
end