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
    
    resource :list_personnel_sekjen do
      desc "Return all Personnel Sekjen List"
      get do
        sekjen_array = Array.new
        
        # Prepare conditions based on params
        valid_params = {
          personil_id: 'id',
          struktur_id: 'struktur_id',
          jabatan_id: 'jabatan_id',
          bagian_subbag_id: 'bagian_subbagian_id'
        }
        
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end
        
        #set limit, default is `10`
        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]
        
        # Build Data
        Personil.includes(:so, :position, :divsubdivision)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .order("id asc")
          .each do |sekjen|
            sekjen_array << {
              id: sekjen.id,
              struktur_sekjen: {
                struktur_id: sekjen.struktur_id,
                nama_struktur: sekjen.so.nama_so
              },
              jabatan: {
                jabatan_id: sekjen.jabatan_id,
                nama_jabatan: sekjen.position.nama_jabatan
              },
              nama: sekjen.nama,
              golongan: sekjen.golongan,
              no_induk: sekjen.no_induk,
              Bagian: {
                bagian_subbag: sekjen.bagian_subbagian_id,
                nama_bagian: !sekjen.divsubdivision.blank? ? (!sekjen.divsubdivision.division.blank? ? sekjen.divsubdivision.division.nama_bagian : "0") : "0",
                nama_subbagian: !sekjen.divsubdivision.blank? ? (!sekjen.divsubdivision.subdivision.blank? ? sekjen.divsubdivision.subdivision.nama_subbagian : "0") : "0"
              }
            }
          end

          # Send output as JSON format
          {
            results: {
              count: sekjen_array.count,
              total: Personil.where(conditions).count,
              struktur_sekjen: sekjen_array
            }
          }
      end
    end
    
    resource :list_organisasi_sekjen do
      desc "Return all Struktur Organisasi Sekjen"
      get do
        organisasi_sekjen = Array.new
        
        # Prepare conditions based on params
        valid_params = {
          organisasi_id: 'id'
        }
        
        # conditions = Hash.new
        # valid_params.each_pair do |key, value|
          # conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
      # end
      
      #set limit, default is `10`
      limit = params[:limit].to_i == 0 || params[:limit].empty? ? 10 : params[:limit]
      
      #build data
      So.all
        .limit(limit)
        .offset(params[:offset])
        .each do |sekjen|
          organisasi_sekjen << {
            organisasi_id: sekjen.id,
            nama_organisasi: sekjen.nama_so
          }
        end
        
        #send output as json format
        {
          result: {
            count: organisasi_sekjen.count,
            total: So.all.count,
            organisasi_sekjen: organisasi_sekjen
          }
        }
      end
    end
  end
end