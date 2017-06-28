module PolarisViewHelpers
  module Helper

    def polaris_banner(options, &block)
      render(
        partial: 'polaris/banner',
        locals: { options: options, block: block }
      )
    end

    def polaris_banner_actions(&block)
      render(
        partial: 'polaris/banner_actions',
        locals: { block: block }
      )
    end

    def polaris_button_link_to(name = nil, link_destination = nil, button_options = nil, &block)
      if block_given?
        button_options, link_destination, name = link_destination, name, nil
      end
      button_options ||= {}

      additional_classes = ""
      (button_options[:modifiers] || []).each do |modifier|
        additional_classes += "Polaris-Button--#{modifier} "
      end
      render(
        partial: 'polaris/button_link_to',
        locals: {
          name: name,
          block: block,
          additional_classes: additional_classes,
          link_destination: link_destination,
          method: button_options[:method]
        }
      )
    end

    def polaris_model_errors model
      render(
        partial: 'polaris/model_errors',
        locals: { model: model }
      )
    end

    def polaris_page_actions(options)
      render(
        partial: 'polaris/page_actions',
        locals: options
      )
    end

    def polaris_button_tag(name, button_options)
      additional_classes = ""
      (button_options[:modifiers] || []).each do |modifier|
        additional_classes += "Polaris-Button--#{modifier} "
      end

      button_options[:additional_classes] = additional_classes
      button_options[:name] = name
      render(
        partial: 'polaris/button_tag',
        locals: button_options
      )
    end

    def polaris_annotated_section_text_field(form, attribute, element_type = :text_field, &block)
      unless attribute.is_a? Array
        attribute = [attribute]
      end

      render(
        partial: 'polaris/annotated_section_text_field',
        locals: {
          form: form,
          attribute: attribute,
          element_type: element_type,
          block: block
        }
      )
    end

    def polaris_annotated_section_input(form, attribute, input, &block)
      unless attribute.is_a? Array
        attribute = [attribute]
      end

      render(
        partial: 'polaris/annotated_section_input',
        locals: {
          form: form,
          attribute: attribute,
          input: input,
          block: block
        }
      )
    end

  end
end
