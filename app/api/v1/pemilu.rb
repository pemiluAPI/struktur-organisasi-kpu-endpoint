module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :struktur_komisioner do
      desc "Return all Struktur Komisioner"
      get do
        struktur_komisioner_array = Array.new

        # Prepare conditions based on params
        valid_params = {
          struktur_id: 'id'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        # Set Limit, default is `10`
        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        # Build Data
        CommisionerStructureList.where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |struktur|
            struktur_komisioner_array << {
              id: struktur.id,
              nama_struktur: struktur.name,
              periode: "#{struktur.period_start} - #{struktur.period_finish}",
              anggota: struktur.commisioner_structures,
            }
          end

          # Send output as JSON format
          {
            results: {
              count: struktur_komisioner_array.count,
              total: CommisionerStructureList.where(conditions).count,
              struktur_komisioner: struktur_komisioner_array
            }
          }
      end
    end

    resource :list_struktur_komisioner do
      desc "Return all Struktur Komisioner List"
      get do
        struktur_komisioner_array = Array.new

        # Set Limit, default is `10`
        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        # Build Data
        CommisionerStructureList.all
          .limit(limit)
          .offset(params[:offset])
          .each do |struktur|
            struktur_komisioner_array << {
              id: struktur.id,
              nama_struktur: struktur.name,
              periode: "#{struktur.period_start} - #{struktur.period_finish}"
            }
          end

          # Send output as JSON format
          {
            results: {
              count: struktur_komisioner_array.count,
              total: CommisionerStructureList.all.count,
              struktur_komisioner: struktur_komisioner_array
            }
          }
      end
    end
  end
end