    <% if book.favorited_by?(current_user) %>
    <p>
      <%= link_to book_favorites_path(book), method: :delete do %>
       ♥<%= book.favorites.count %>
      <% end %>
    </p>
    <% else %>
    <p>
      <%= link_to book_favorites_path(book), method: :post do %>
       ♡<%= book.favorites.count %>
      <% end %>
    </p>
      <% end %>
