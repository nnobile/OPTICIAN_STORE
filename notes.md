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

<% if @optometrist.errors.any? %>
    <div id="error_explanation">
    <h2><%= pluralize(@optometrist.errors.count), "error" %>

    <ul>
    <%=optometrist.errors.full_messages.each do |error| %>
        <li><%= error %></li>
    <% end %>
    </ul>
    </div>
<% end %>


 <%= f.label :optometrist %>
    <%= f.fields_for :optometrist do |o| %>
        <%= o.label :first_name %>
        <%= o.text_field :first_name %>
    <% end %>

1 - Omniauth route needs to redirect to registration page IF no existing user is recognized.
2 - Build lougout links and add to every view





