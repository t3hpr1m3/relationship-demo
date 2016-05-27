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
      param_name = key
      filter_name = key
      if key.is_a?(Array)
        param_name = key.first
        filter_name = key.last
      end

      if params.key?(param_name) && params[param_name].present?
        @filters[filter_name] = params[param_name]
      end

      if params.key?("search.#{param_name}") && params["search.#{param_name}"].present?
        @searches[filter_name] = params["search.#{param_name}"]
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
