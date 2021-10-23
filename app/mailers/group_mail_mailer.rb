class GroupMailMailer < ApplicationMailer
    def email_layout
        @announcement = params[:announcement]

        mail(to: 'diego_servin101@tamu.edu', subject: @announcement.title)
    end

    def email_image_tag(image, **options)
        attachments[image] = File.read(Rails.root.join("app/assets/images/DebateLogo.png"))
        image_tag attachments[image].url, **options
    end
end