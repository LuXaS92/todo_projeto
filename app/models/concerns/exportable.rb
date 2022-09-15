require 'csv'

module Exportable
  extend ActiveSupport::Concern


  def export_csv
    headers = ['Descricao', 'Finalizada?', 'ID da tarefa pai', 'Criada em', 'Atualizada em']

    csv = CSV.generate(write_headers: true, headers: headers) do |row|
      Task.all.each do |task|
        row << [
          task.description,
          task.done? ? 'Sim' : 'Nao',
          task.parent_id,
          task.created_at,
          task.updated_at
        ]
      end
    end

    send_data csv, type: 'text/csv; charset=utf-8; header=present',
      disposition: 'attachment; filename=tarefas.csv'

  end
end