desc "Collect latest stats"
require "net/https"

task :cron => :environment do
  greps = Grep.all
  pages = Page.all
  
  pages.each{|page|
    puts "#{page.name} => #{page.url}"
    
    url = URI.parse(page.url)
    #req = Net::HTTP::Get.new(url.path)
    #res = Net::HTTP.start(url.host, url.port) {|http|
    #  http.request(req)
    #}
    #puts res.body
    
    puts "#{url.host} #{url.port} #{url.path}"
    body = nil
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    https.start do |http|
      req = Net::HTTP::Get.new(url.path)
      response = http.request(req)
      body = response.body
    end
    
    greps.each{|grep|
      puts grep.name
      
      if(Raw.where({:page_id => page.id, :grep_id => grep.id, :date => Date.today}).length > 0)
        puts "Todays number already found"
        next
      end
      
      if(body =~ /#{grep.search}/m )
        found = $1;
        found.gsub!(',', '')
                puts "FOUND #{found}"
        
        stat = Raw.new({:page_id => page.id, :grep_id => grep.id, :date => Date.today, :value => found})
        stat.save!
      end
    }
  }
  
end