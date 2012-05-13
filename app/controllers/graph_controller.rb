class GraphController < ApplicationController
    def index
        greps = Grep.all

        page_names = Array.new
        page_ids = Hash.new
        i = 0
        Page.all.each do |page|
            page_names << page.name
            page_ids[page.id] = i
            i = i+1
        end

        # currently only supports one grep, but can be extended
        greps.each do |grep|
            points = Hash.new

            grep.raw.each do |raw|
                # create graph point if it doesn't already exist
                if !points.has_key?(raw.date)
                    points[raw.date] = GraphPoint.new(raw.date, page_names.size)
                end

                # add data to graph point
                points[raw.date].points[page_ids[raw.page_id]] = raw.value
            end
            
            
            
            @graph = page_names.collect {|name|
                "data.addColumn('number', '#{name}');"
            }.join("\n");
            
            @graph << points.sort.collect { |date, graph_point|
                "data.addRow([#{graph_point.date}, #{graph_point.points.join(',')}]);"
            }.join("\n");

            #@graph = "['Date', #{page_names.collect {|name| "'#{name}'"}.join(',')}], \n#{points.sort.collect { |date, graph_point| "[#{graph_point.date}, #{graph_point.points.join(',')}]"}.join(",\n")}" 
            
        end
    end
end

class GraphPoint
    attr_accessor :date
    attr_accessor :points

    def initialize(date, size)
        @date = "new Date(#{date.year}, #{date.month-1}, #{date.day})"
        #@date = date.to_time.to_i
        @points = Array.new

        for i in 1..size
            @points << "null"
        end
    end 
end