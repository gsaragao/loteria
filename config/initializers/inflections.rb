ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
inflect.plural /^([a-zA-z]*)al$/i, '\1ais'
inflect.singular /^([a-zA-z]*)ais$/i, '\1al'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
#  inflect.irregular 'unidade', 'unidades'
 end