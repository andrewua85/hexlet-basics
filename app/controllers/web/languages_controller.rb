# frozen_string_literal: true

class Web::LanguagesController < Web::ApplicationController
  def show
    @language = Language.find_by!(slug: params[:id])
    @current_modules = @language.current_modules
                                .includes(:module)
                                .order(:order)
                                .eager_load(:lesson_versions)
                                .merge(
                                  Language::Lesson::Version.includes(:lesson).order(:order)
                                )
    @infos_by_module = @language.current_module_infos.with_locale.index_by(&:version_id)
    @infos_by_lesson = @language.current_lesson_infos.with_locale.index_by(&:version_id)
  end
end
