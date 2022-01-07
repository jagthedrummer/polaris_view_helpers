module PolarisViewHelpers
  module Helper

    def polaris_css version = '7.5.0'
      major_version = version.split('.').first.to_i
      if major_version <= 6
        %[<link rel="stylesheet" href="https://unpkg.com/@shopify/polaris@#{version}/dist/styles.css" />].html_safe
      else
        %[<link rel="stylesheet" href="https://unpkg.com/@shopify/polaris@#{version}/build/esm/styles.css" />].html_safe
      end
    end

    def polaris_random_input_name
      "pri-#{SecureRandom.hex(8)}"
    end

    def polaris_choice_list(form:, attribute:, title:, selected:, choices:)
      render(
        partial: 'polaris/choice_list',
        locals: {
          form: form,
          attribute: attribute,
          title: title,
          selected: selected,
          choices: choices
        }
      )
    end

    def polaris_page(&block)
      render(
        partial: 'polaris/page',
        locals: { block: block }
      )
    end

    def polaris_page_header(title, &block)
      render(
        partial: 'polaris/page_header',
        locals: { title: title, block: block }
      )
    end

    def polaris_heading(title)
      render(
        partial: 'polaris/heading',
        locals: { title: title }
      )
    end

    def polaris_sub_heading(title)
      render(
        partial: 'polaris/sub_heading',
        locals: { title: title }
      )
    end

    def polaris_page_content(&block)
      render(
        partial: 'polaris/page_content',
        locals: { block: block }
      )
    end

    def polaris_layout(&block)
      render(
        partial: 'polaris/layout',
        locals: { block: block }
      )
    end

    def polaris_layout_section(secondary: false, &block)
      extra_class = secondary ? "Polaris-Layout__Section--secondary" : ""
      render(
        partial: 'polaris/layout_section',
        locals: { block: block, extra_class: extra_class }
      )
    end

    def polaris_form_layout(&block)
      render(
        partial: 'polaris/form_layout',
        locals: { block: block }
      )
    end

    def polaris_tabs(&block)
      render(
        partial: 'polaris/tabs',
        locals: { block: block }
      )
    end

    def polaris_tab(text, link_path, active = nil)
      unless active.present?
        active = link_path == request.original_fullpath
      end
      render(
        partial: 'polaris/tab',
        locals: {
          text: text,
          link_path: link_path,
          active: active
        }
      )
    end

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

      additional_classes = button_options[:additional_classes] || ""
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
          method: button_options[:method],
          remote: button_options[:remote],
          target: button_options[:target],
          confirm: button_options[:confirm]
        }
      )
    end

    def polaris_link_to(name = nil, link_destination = nil, button_options = nil, &block)
      if block_given?
        button_options, link_destination, name = link_destination, name, nil
      end
      button_options ||= {}

      additional_classes = ""
      (button_options[:modifiers] || []).each do |modifier|
        additional_classes += "Polaris-Button--#{modifier} "
      end
      render(
        partial: 'polaris/link_to',
        locals: {
          name: name,
          block: block,
          additional_classes: additional_classes,
          link_destination: link_destination,
          method: button_options[:method],
          confirm: button_options[:confirm]
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

    def polaris_annotated_section(heading:'', description:'', &block)
      render(
        partial: 'polaris/annotated_section',
        locals: {
          heading: heading,
          description: description,
          block: block
        }
      )
    end

    def polaris_form_layout_item(form, att, text = nil, &block)
      render(
        partial: 'polaris/form_layout_item',
        locals: {
          form: form,
          att: att,
          text: text,
          block: block
        }
      )
    end

    def polaris_form_layout_item_select(form, att, text = nil, &block)
      render(
        partial: 'polaris/form_layout_item_select',
        locals: {
          form: form,
          att: att,
          text: text,
          block: block
        }
      )
    end

    def polaris_text_field(form, attribute, options = {}, element_type = :text_field, &block)
      unless attribute.is_a? Array
        attribute = [attribute]
      end

      render(
        partial: 'polaris/text_field',
        locals: {
          form: form,
          attribute: attribute,
          element_type: element_type,
          options: options,
          block: block
        }
      )
    end

    def polaris_text_area(form, attribute, options = {}, element_type = :text_area, &block)
      polaris_text_field(form, attribute, options, element_type, &block)
    end

    def polaris_annotated_section_text_field(form, attribute, options = {}, element_type = :text_field, &block)
      unless attribute.is_a? Array
        attribute = [attribute]
      end

      render(
        partial: 'polaris/annotated_section_text_field',
        locals: {
          form: form,
          attribute: attribute,
          element_type: element_type,
          options: options,
          block: block
        }
      )
    end

    def polaris_annotated_section_select(form, attribute, select_options = [], element_type = :select, &block)
      unless attribute.is_a? Array
        attribute = [attribute]
      end

      render(
        partial: 'polaris/annotated_section_select',
        locals: {
          form: form,
          attribute: attribute,
          element_type: element_type,
          select_options: select_options,
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

    def polaris_resource_list(&block)
      render(
        partial: 'polaris/resource_list',
        locals: { block: block }
      )
    end

    def polaris_resource_list_item(attributes)
      extra_classes = attributes[:media].present? ? "Polaris-ResourceList__Item--mediaThumbnail Polaris-ResourceList__Item--sizeMedium" : ""
      render(
        partial: 'polaris/resource_list_item',
        locals: { attributes: attributes, extra_classes: extra_classes }
      )
    end

    def polaris_badge(content, status = nil)
      extra_class = status.present? ? "Polaris-Badge--status#{status.to_s.capitalize}" : ""
      render(
        partial: 'polaris/badge',
        locals: { content: content, status: status, extra_class: extra_class }
      )
    end

    def polaris_thumbnail(attributes)
      render(
        partial: 'polaris/thumbnail',
        locals: { attributes: attributes }
      )
    end

    def polaris_description_list(&block)
      render(
        partial: 'polaris/description_list',
        locals: { block: block }
      )
    end

    def polaris_description_list_item(term, &block)
      render(
        partial: 'polaris/description_list_item',
        locals: { block: block, term: term }
      )
    end

    def polaris_card(heading = nil, footer: nil, &block)
      render(
        partial: 'polaris/card',
        locals: { block: block, heading: heading, footer: footer }
      )
    end

    def polaris_footer_help(icon: 'next-help-circle', &block)
      render(
        partial: 'polaris/footer_help',
        locals: { block: block, icon: icon }
      )
    end

    def polaris_css_variable_hack_div(&block)
      render(
        partial: 'polaris/polaris_css_variable_hack_div',
        locals: { block: block }
      )
    end

  end
end
