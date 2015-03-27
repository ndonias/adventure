
# For Profile

  
  <form action="<%= user_filters_create_path %>" method="post" class="search-bar">
    <input type="hidden" name="_method" value="put">

    <input type="text" name="user_filter[beg_age]" value="<%= @user_filter.beg_age %>">
    <span class="block-floated">to</span>
    <input type="text" name="user_filter[end_age]" value="<%= @user_filter.end_age %>">
    <span class="block-floated">years old |</span>

    <select name="user_filter[sex]" >
      <% PROFILE_DETAILS["sex"].each do |k, v| %>
      <option value="<%= k %>" <%= "selected" if @user_filter.sex == k %>>
        <%= v %>
      </option>
      <% end %>

      <option value="" <%= "selected" if @user_filter.sex.nil? %>>
        Everyone
      </option>
    </select>

    <input type="submit" value="Refresh">
  </form>


						<%= f.hidden_field :weights %>
						<%= f.check_box :weights, checked: false %> Weight Lifting 

						<%= f.hidden_field :running %>
						<%= f.check_box :running, checked: false, value: true %>
						<%= f.label :running, 'Running' %>
						
						<%= f.hidden_field :biking %>
						<%= f.check_box :biking, checked: false %>
						<%= f.label :biking, 'Biking' %> <br>

						<%= f.hidden_field :swimming %>
						<%= f.check_box :swimming, checked: false %>
						<%= f.label :swimming, 'Swimming' %>

						<%= f.hidden_field :rocks %>
						<%= f.check_box :rocks, checked: false %>
						<%= f.label :rocks, 'Rock Climbing' %>

						<%= f.hidden_field :hiking %>
						<%= f.check_box :hiking, checked: false %> <br>
						<%= f.label :hiking, 'Hiking' %>

						<%= f.hidden_field :yoga %>
						<%= f.check_box :yoga, checked: false %>
						<%= f.label :yoga, 'Yoga' %>

						<%= f.hidden_field :dance %>
						<%= f.check_box :dance, checked: false %>
						<%= f.label :dance, 'Dancing' %>