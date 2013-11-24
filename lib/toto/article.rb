require 'toto/template'

module Toto
  class Article < Hash
    include Template

    def initialize obj, config = {}
      @obj, @config = obj, config
      self.load if obj.is_a? Hash
    end

    def load
      data = if @obj.is_a? String
        meta, self[:body] = File.read(@obj).split(/\n\n/, 2)

        # use the date from the filename, or else toto won't find the article
        @obj =~ /\/(\d{4}-\d{2}-\d{2})[^\/]*$/
        ($1 ? {:date => $1} : {}).merge(YAML.load(meta))
      elsif @obj.is_a? Hash
        @obj
      end.inject({}) {|h, (k,v)| h.merge(k.to_sym => v) }

      self.taint
      self.update data
      self[:date] = Date.parse(self[:date].gsub('/', '-')) rescue Date.today
      self
    end

    def [] key
      self.load unless self.tainted?
      super
    end

    def slug
      self[:slug] || self[:title].slugize
    end

    def summary length = nil
      if summary = self[:summary]
        markdown summary
      else
        config = @config[:summary]
        sum = if self[:body] =~ config[:delim]
          self[:body].split(config[:delim]).first
        else
          self[:body].match(/(.{1,#{length || config[:length] || config[:max]}}.*?)(\n|\Z)/m).to_s
        end
        markdown(sum.length == self[:body].length ? sum : sum.strip.sub(/\.\Z/, '&hellip;'))
      end
    end

    def url
      "http://#{(@config[:url].sub("http://", '') + self.path).squeeze('/')}"
    end
    alias :permalink url

    def body
      markdown self[:body].sub(@config[:summary][:delim], '') rescue markdown self[:body]
    end

    def path
      "/#{@config[:prefix]}#{self[:date].strftime("/%Y/%m/%d/#{slug}/")}".squeeze('/')
    end

    def title()   self[:title] || "an article"               end
    def date()    @config[:date].call(self[:date])           end
    def author()  self[:author] || @config[:author]          end
    def to_html() self.load; super(:article, @config)        end
    alias :to_s to_html
  end
end
