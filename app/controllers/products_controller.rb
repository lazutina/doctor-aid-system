require 'roo'
class ProductsController < ApplicationController
  def index
    @products = Product.search([], params[:page])
  end

  # GET /users/new
  def new
    @products  = []
  end

  # POST /users
  # POST /users.json
  def create
    file = params[:file]
    workbook =
       case File.extname(file.original_filename)
             when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
             when ".xls" then Roo::Excel.new(file.path, nil)
             when ".xlsx" then Roo::Excelx.new(file.path)
             else raise "Unknown file type: #{file.original_filename}"
       end

    workbook.default_sheet = workbook.sheets[0]

    headers = Hash.new
    workbook.row(1).each_with_index {|header,i|
      headers[header] = i
    }

    @products = []

    ((workbook.first_row + 1)..workbook.last_row).each do |row|
      product = Product.new ;

      product.account_unit = workbook.row(row)[headers['Account Unit']]
      product.account = workbook.row(row)[headers['Account']]
      product.sub_account = workbook.row(row)[headers['Sub Account']]
      product.vendor = workbook.row(row)[headers['Vendor']]
      product.lawson_item_number = workbook.row(row)[headers['Item/Lawson']]
      product.description = workbook.row(row)[headers['Description']]
      product.mfg_code = workbook.row(row)[headers['Mfg Code']]
      product.mfg_nbr = workbook.row(row)[headers['Mfg Nbr']]
      product.po_date = workbook.row(row)[headers['PO Date']]
      product.po_number = workbook.row(row)[headers['PO Nmbr']]
      product.po_line = workbook.row(row)[headers['PO Line']]
      product.qty = workbook.row(row)[headers['Qty']]
      product.uom = workbook.row(row)[headers['UOM']]
      product.unit_cost = workbook.row(row)[headers['Unit Cost']]
      product.total_cost = workbook.row(row)[headers['Total Cost']]

      if(product.save())
        @products.push(product)
      end

    end
  end

end
