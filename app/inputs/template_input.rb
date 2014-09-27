class TemplateInput < SimpleForm::Inputs::Base
  def input
    @builder.select(attribute_name, Template.all.collect(&:name), {}, class: 'form-control')
  end
end