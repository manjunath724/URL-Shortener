module Features
  module ShortenerHelpers
    # Add a URL to Shortener service
    def add_url
      click_link "Add New"

      fill_in "shortener[main_domain]", with: Faker::Internet.url
      click_button "Create Shortener"
    end

    # Append URLs to Shortened service
    def append_url(url)
      click_link "Add New"

      fill_in "shortener[main_domain]", with: Faker::Internet.url(url)
      click_button "Create Shortener"
    end

    # Remove a URL from Shortener service
    def remove_url
      s = Shortener.all.order(updated_at: :desc).first(10).sample
      find_by_id("remove-#{s.id}").click
      page.driver.browser.switch_to.alert.accept
    end

    # Redirects the user to target URL
    def abbrev_redirection
      s = Shortener.all.order(updated_at: :desc).first(10).sample
      click_on "#{s.abbrev}"
      sleep 3
      last_handle = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.window(last_handle)
      page.driver.browser.close
      sleep 1
    end

    # Navigates through pagination
    def navigate_pagination
      2.upto(7) do |n|
        sleep 1
        click_link n
        window = page.driver.browser.window_handles

        if window.size > 1
          sleep 1
          page.driver.browser.switch_to.window(window.last)
          page.driver.browser.close
          page.driver.browser.switch_to.window(window.first)
        end
      end
    end
  end
end
