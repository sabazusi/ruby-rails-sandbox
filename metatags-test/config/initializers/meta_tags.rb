# follow best practice for now
MetaTags.configure do |c|
  c.title_limit = 70
  c.description_limit = 160
  c.keywords_limit = 255
  c.keywords_separator = ','
end

# 以下を参考に、helpers.strip_tagsではなくhelpers.sanitizeを使用するようにした
# @see  https://github.com/kpumuk/meta-tags/issues/103
module MetaTags
  module TextNormalizer
    def self.strip_tags(string)
      ERB::Util.html_escape helpers.sanitize(string)
    end
  end
end
