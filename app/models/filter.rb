class Filter
  attr_reader :searches, :filters

  def initialize(keys, params)
    #
    # extract the search keys
    #
    @params = params.stringify_keys
    @searches = {}
    @filters = {}
    keys.each do |key|
      if params.key?(key) && params[key].present?
        @filters[key] = params[key]
      end

      if params.key?("search.#{key}") && params["search.#{key}"].present?
        @searches[key] = params["search.#{key}"]
      end
    end
  end

  def apply(relation)
    res = relation.all
    @filters.each do |key, value|
      if key =~ /\./ # contains a dot
        association, field = key.split('.')
        res = res.includes(association).where("#{association}.#{field}" => value)
      else
        res = res.where(key => value)
      end
    end

    @searches.each do |key, value|
      if key =~ /\./ # contains a dot
        association, field = key.split('.')
        res = res.includes(association).where("#{association}.#{field} LIKE ?", "%#{value}%")
      else
        res = res.where("#{key} LIKE ?", "%#{value}%")
      end
    end

    res
  end

  def active?
    @filters.present? || @searches.present?
  end
end
