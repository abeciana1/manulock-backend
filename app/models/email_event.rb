class EmailEvent < ApplicationRecord
    belongs_to :email

    validates :event_type, presence: true

    enum event_type: {
        sent: 0,
        delivered: 1,
        opened: 2,
        clicked: 3,
        bounced: 4,
        unsubscribed: 5,
        marked_as_spam: 6,
        replied: 7,
        forwarded: 8,
        conversion: 9,
        complaint: 10,
        deferred: 11,
        dropped: 12
    }

    enum device_type: {
        desktop: 0,
        mobile: 1,
        tablet: 2,
        smartwatch: 3,
        webmail: 4,
        other_device: 5
    }

    enum email_client: {
        gmail: 0,
        outlook: 1,
        yahoo: 2,
        apple_mail: 3,
        thunderbird: 4,
        other_client: 5
    }
end
