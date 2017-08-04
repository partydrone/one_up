module ApplicationHelper
  def format_date_range(from_date, to_date)
    return from_date.strftime('%b %e, %Y') if from_date.to_date == to_date.to_date

    from_month, to_month = from_date.month, to_date.month
    from_day, to_day     = from_date.day, to_date.day
    from_year, to_year   = from_date.year, to_date.year

    from_date_template = []
    from_date_template << '%b'
    from_date_template << "%e#{',' unless from_year == to_year}"
    from_date_template << '%Y' unless from_year == to_year

    to_date_template = []
    to_date_template << '%b' unless from_month == to_month
    to_date_template << '%e, %Y'

    output = [
      from_date.strftime(from_date_template.join(' ')),
      to_date.strftime(to_date_template.join(' '))
    ].join('–')

    return output
  end

  def format_time_range(from_date, to_date)
    from_time_meridian = from_date.strftime('%p')
    to_time_meridian   = to_date.strftime('%p')

    from_time_template = '%l:%M'

    if (from_date.to_date != to_date.to_date) || ((from_date.to_date == to_date.to_date) && (from_time_meridian != to_time_meridian))
      from_time_template += ' %p'
    end

    to_time_template = '%l:%M %p'

    output = [
      from_date.strftime(from_time_template),
      to_date.strftime(to_time_template)
    ].join('–')

    return output
  end

  def full_title(page_title = nil)
    title = ['One Up']
    title << page_title if page_title.present?
    strip_tags title.join(' - ')
  end
end
