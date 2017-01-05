<h3>Sign Up</h3>

<% unless locals.empty? %>
<%= message %>
<% end %> 

<%= form_for(@user) do |f| %>
      <%= f.label :name %>
      <%= f.text_field :name %>

      <%= f.label :email %>
      <%= f.email_field :email %>

      <%= f.label :password %>
      <%= f.password_field :password %>

      <%= f.label :password_confirmation, "Confirmation" %>
      <%= f.password_field :password_confirmation %>

      <%= f.submit "Create", class: "btn btn-primary" %>
    <% end %>