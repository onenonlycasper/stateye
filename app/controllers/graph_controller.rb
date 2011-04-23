class GraphController < ApplicationController
  def index
    greps = Grep.all
    
    @g = Hash.new
    
    greps.each{|grep|
      h = Hash.new
      raws = grep.raw
      
      raws.each{|raw|
        if(!h.has_key?(raw.page.name))
          h[raw.page.name] = Array.new
        end
        
        h[raw.page.name] << raw
      }
      
      
      @g[grep.name] = h
    }
  end

end
