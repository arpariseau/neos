class NEOTablemaker

  def format_columns(asteroid_list)
    column_labels = { name: "Name", diameter: "Diameter", miss_distance: "Missed The Earth By:" }
    column_labels.each_with_object({}) do |(col, label), hash|
      hash[col] = {
        label: label,
        width: [asteroid_list.map { |asteroid| asteroid[col].size }.max, label.size].max}
    end
  end

  def format_header(column_data)
    "| #{ column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"
  end

  def format_divider(column_data)
    "+-#{column_data.map { |_,col| "-"*col[:width] }.join('-+-') }-+"
  end

  def format_row_data(row_data, column_info)
    row_data.keys.map { |key| row_data[key].ljust(column_info[key][:width]) }.join(' | ')
  end

  def create_rows(asteroid_data, column_info)
    asteroid_data.each { |asteroid| puts "| #{format_row_data(asteroid, column_info)} |" }
  end

end
