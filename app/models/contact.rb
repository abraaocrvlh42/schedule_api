class Contact < ApplicationRecord
  belongs_to :kind

  def author
    'Abraão Carvalho'
  end

  def as_json (options = {})
    super(
      root: true,
      methods: :author,
      include: { kind: {only: :description}}
    )
  end
end
