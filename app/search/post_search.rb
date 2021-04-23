module PostSearch
  extend ActiveSupport::Concern

  SEARCH_FIELDS = [:title, :short_description]

  included do
    searchkick word_middle: SEARCH_FIELDS

    # Callbacks
    after_commit :reindex_model

    # Scope
    scope :search_import, -> { where(state: :published) }
    scope :by_ids, -> (ids){ where id: ids }

    def self.search_results str_query
      search_results = search str_query,
        fields: SEARCH_FIELDS,
        match: :word_middle,
        misspellings: {below: 5}

      by_ids(search_results.pluck(:id))
    end

    def should_index?
      published?
    end

    def reindex_model
      reindex
    end
  end

  def search_data
    {
      title: title,
      short_description: short_description
    }
  end
end
