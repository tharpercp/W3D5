
# in a regular BFS search, the Tree already exists

# in a regular BFS search, at every node -- starting with the root node -- we search the node, then add its children to the queue

# the Knights problem is very similar, except the Tree doesn't exist yet! we only have ONE node, the root node, and it doesn't have any children -- YET!

# so to build the tree, we can build an algorithm similar to a BFS
# but instead of SEARCHING a tree node by node (starting at the root), it CREATES a tree node by node (starting at the root)

# we start by building a queue that has the root node inside it as its only element

# then we processes the queue:
# 
#   shift out the first element of the queue
#       (let's call this the "current node")
#   generate a list of all unique positions the current node can move to
#           (use new_move_positions to do this)
#           (this is like a list of POTENTIAL children)
#   for EACH position in this list:
#       create a node with that position as its value
#       add the new node to the current node's children
#       add the current node as the new node's parent
#               (this step may not be necessary)
#       add the new node to the queue
#               !!!!!!
#               this is the most important idea
#               adding each new node to the queue is how we keep building the Tree,
#               BUT (!!) the list of new nodes keeps getting smaller and smaller
#               due to the fact that "new_move_positions" keeps a list of positions we've already visited
#               i.e. we will eventually run out of new nodes/children to add
#               !!!!!!

# repeat over and over again until no new nodes are added to the queue (because "new_move_positions" has run out of new positions to generate)
#   i.e. until queue.empty?