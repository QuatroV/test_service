class FlussoniclastversionController < ApplicationController
    def get
        this_month_release = Version.find_by(release_date: (Time.zone.now.beginning_of_month..Time.zone.now.end_of_month))
        if this_month_release
            this_month_release_date = this_month_release.release_date
            if this_month_release_date > Date.today
                last_version = (this_month_release_date - 1.month)
            else
                last_version = this_month_release_date
            end
        else
            new_release_date = rand(Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
            Version.create(release_date: new_release_date)
            if new_release_date > Date.today
                last_version = (new_release_date - 1.month)
            else
                last_version = new_release_date
            end
        end
        respond_to do |format|
            format.json { render json: {version: last_version }}
        end
    end
end
