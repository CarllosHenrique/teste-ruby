module ApplicationHelper
  def status_badge(status)
    classes =
      case status.to_s
      when "paid"    then "bg-green-100 text-green-800"
      when "failed"  then "bg-red-100 text-red-800"
      else                "bg-gray-100 text-gray-800"
      end
    tag.span status.to_s.titleize, class: "inline-flex items-center rounded px-2 py-0.5 text-xs font-medium #{classes}"
  end
end
