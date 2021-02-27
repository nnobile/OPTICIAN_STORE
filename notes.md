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

1 - Omniauth route needs to redirect to registration page IF no existing user is recognized. WIP
2 - Order by revenue in the Patient view in order to apply the scope method (done)
3 - In the patient create form, we need to add a dropdown for the optometrist index which will allow the user to select. Also, we need to create a link_to in order to redirect to a new optometrist. WIP
4 - We need to basically link the patient to the optometrist and vice versa. WIP




