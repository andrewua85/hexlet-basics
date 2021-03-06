# frozen_string_literal: true

language = Language.create!(slug: Faker::ProgrammingLanguage.name)
language_version = Language::Version.create!(
  docker_image: 'docker_image',
  exercise_filename: 'index.js',
  exercise_test_filename: 'test.js',
  extension: '.js',
  name: Faker::ProgrammingLanguage.name,
  language_id: language.id
)
language.update(current_version_id: language_version.id)

language_module = Language::Module.create!(
  slug: 'Basic',
  language_id: language.id
)
language_module_version = Language::Module::Version.create!(
  language_version_id: language_version.id,
  module_id: language_module.id,
  order: 1
)
language_module.update(current_version_id: language_module_version.id)

language_module_lesson = Language::Module::Lesson.create!(
  slug: 'variables',
  language_id: language.id,
  module_id: language_module.id
)
language_module_lesson_version = Language::Module::Lesson::Version.create!(
  language_version_id: language_version.id,
  module_version_id: language_module_version.id,
  lesson_id: language_module_lesson.id,
  order: 1,
  original_code: 'original_code',
  prepared_code: 'prepared_code',
  test_code: 'test_code',
  path_to_code: 'path/to/code'
)
language_module_lesson.update(current_version_id: language_module_lesson_version.id)

Language::Module::Description.create!(
  name: Faker::Lorem.word,
  description: Faker::Lorem.paragraph,
  locale: 'ru',
  module_id: language_module.id,
  language_id: language.id
)
Language::Module::Lesson::Description.create!(
  instructions: Faker::Lorem.paragraph_by_chars(number: 400),
  locale: 'ru',
  name: Faker::Lorem.word,
  theory: Faker::Lorem.paragraph_by_chars(number: 400),
  tips: Faker::Lorem.word,
  definitions: Faker::Lorem.paragraph,
  lesson_id: language_module_lesson.id,
  language_id: language.id
)
