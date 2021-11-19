# frozen_string_literal: true

json.array! @points_events, partial: 'points_events/points_event', as: :points_event
