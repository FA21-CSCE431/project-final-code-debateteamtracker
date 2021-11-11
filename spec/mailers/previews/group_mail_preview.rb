# Preview all emails at http://localhost:3000/rails/mailers/group_mail
class GroupMailPreview < ActionMailer::Preview
    def email_layout
      # Set up a temporary order for the preview
      announcement = Announcement.new(title: "Weekly Meeting", description: "This week we will have a meeting at..", author: "Texas A&M Debate Team",  date: "12-12-2012")

      GroupMailMailer.with(announcement: announcement).email_layout
    end
end