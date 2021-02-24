Errors:

<% if @patient.errors.any? %>
    <div id="error_explanation">
    <h2><%= pluralize(@patient.errors.count), "error" %>

    <ul>
    <%=patient.errors.full_messages.each do |error| %>
        <li><%= error %></li>
        <% end %>
    </ul>
    </div>
<% end %>



