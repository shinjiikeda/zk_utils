require "zk_utils/version"

class ZkUtils
  attr_reader :zk

  def initialize(conn)
    @zk = ZK.new(conn)
  end
  
  def ls(path, opts={})
    if opts[:r] == false
      return @zk.children(path)
    end
    list = []
    get_children_r(list, path)
  end
  
  def delete(path, opts={})
    if opts[:r] == false
      @zk.delete(path)
    end
    
    list = ls(path, :r => true)
    list.reverse!.each do | node |
      next if node =~ /^\/zookeeper(\/.*)?$/
      @zk.delete(node)
    end
  end
  
  private
  
  def get_children_r(list, path)
    r = @zk.children(path)
    path = path == "/" ? "" : path
    r.each do | node |
      list << path + "/" + node
      get_children_r(list, path + "/" + node)
    end
    return list
  end
end
