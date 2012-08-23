module EventsHelper

  def statuses_list(event_list)
    event_list.keys.map {|item| item.to_s.titleize}
  end
end
